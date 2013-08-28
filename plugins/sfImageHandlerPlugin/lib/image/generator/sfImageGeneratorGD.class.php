<?php
/**
 * This file is part of the sfImageHelper plugin.
 * (c) 2009 Kousuke Ebihara <ebihara@tejimaya.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * sfImageGeneratorGD
 *
 * @package    sfImageHandlerPlugin
 * @subpackage image
 * @author     Kousuke Ebihara <ebihara@tejimaya.com>
 */
class sfImageGeneratorGD
{
    protected
    $quality     = 80,
    $width       = 0,
    $height      = 0,
    $format      = 'jpg',
    $allowedSize = array('40x40','48x48', '60x60', '64x64', '70x70', '74x74', '76x76', '80x80'
    , '85x85', '87x87', '90x90', '95x95','94x106', '99x99', '100x100', '100x166','106x94', '109x109','115x115', '110x178'
    , '110x180', '120x120', '126x126', '130x130','145x145', '149x149', '150x150','155x138', '156x156'
    , '160x260', '160x160', '170x170', '180x180', '200x200', '213x213', '260x260', '240x320', '550x550','600x600'
    , '434x434', '480x480',  '192x300', '192x192', "300x300", '300x192', '192x400', '400x192', '400x400','150x200','460x331'),
    $outputImage = null;

    public $source_format = null;

    public function __construct(array $options = array())
    {
        $this->initialize($options);
        $this->configure();
    }

    /**
  * Initializes this generator.
  */
    public function initialize($options)
    {
        $options = array_merge(array('width' => $this->width, 'height' => $this->height), $options);
        $this->setImageSize($options['width'], $options['height']);

        if (isset($options['quality']))
        {
            if ($this->height > 115) {
                $this->quality = $options['quality'];
            } else  {
                $this->quality = 100;
            }
        }

        if (isset($options['format']))
        {
            $this->format = $options['format'];
        }
    }

    public function configure()
    {
    }

    /**
  * Configures the output image size
  */
    public function setImageSize($width, $height)
    {
        if (is_numeric($width))
        {
            $this->width = $width;
        }

        if (is_numeric($height))
        {
            $this->height = $height;
        }
    }

    public function output($outputFilename)
    {
        $result = false;

        if (!is_dir(dirname($outputFilename)))
        {
            $currentUmask = umask(0000);
            if (false === @mkdir(dirname($outputFilename), 0777, true))
            {
                throw new sfRuntimeException('Failed to make cache directory.');
            }
            umask($currentUmask);
        }

        //var_dump($this->outputImage); exit();
        //var_dump(imagesx($this->outputImage)); exit();

        switch ($this->format)
        {
            case 'png':
                $result = imagepng($this->outputImage, $outputFilename);
                break;
            case 'gif':
                imagedestroy($this->outputImage);
                $result = imagegif($this->outputImage, $outputFilename);
                break;
            default:
//                $thumbSize = 250; // will create a 250 x 250 thumb
//                $this->thumb = imagecreatetruecolor($thumbSize, $thumbSize);
//
//                imagecopyresampled($this->thumb, $this->myImage, 0, 0,$this->x, $this->y, $thumbSize, $thumbSize, $this->cropWidth, $this->cropHeight);
                //$im = imagecreatetruecolor(200, 200);
                //imagecopy($im, $this->outputImage, 0, 0, 0, 0, 200, 200);
                $result = imagejpeg($this->outputImage, $outputFilename, $this->quality);
                //$result = imagejpeg($im, $outputFilename, $this->quality);
        }

        if ($result)
        {
            return file_get_contents($outputFilename);
        }

        return false;
    }

    /**
  * Resizes an input image
  */
    public function resize($binary, $format, $is_crop = false, $border = 0)
    {
        if (!$sourceImage = imagecreatefromstring($binary))
        {
            throw new sfException('Cannnot read an image binary.');
        }

        // for mobile phone
        if ('jpg' === $this->format)
        {
            imageinterlace($sourceImage, 0);
        }

        $info = array('f' => $this->format, 'w' => '', 'h' => '');

        if (!$this->width && !$this->height &&
            // quang's convert from png, gif -> jpg
            !($this->format=='jpg' && ($this->source_format=='png' || $this->source_format='gif')))
        {
						$this->setTransparent($sourceImage, $sourceImage);
            $this->outputImage = $sourceImage;
            return $info;
        }

        $source = array(imagesx($sourceImage), imagesy($sourceImage));

				// quang's: ko xac dinh kich thuoc, nhung van goi den phan resize de fill mau trang vao phan nen cua anh
        if (!$this->width && !$this->height) {
            list($this->width, $this->height) = $source;
        }
        // quang's

        $want = array($this->width, $this->height);
        $output = $this->calcOutputImageSize($source, $want);

        $info['w'] = $this->width;
        $info['h'] = $this->height;

        if (!$this->isNeedResize($source, $output) && !$is_crop && $this->source_format!='png' && $this->source_format!='gif')
        {
						$this->setTransparent($sourceImage, $sourceImage);
            $this->outputImage = $sourceImage;
            return $info;
        }


        if ($is_crop) {
            /*CROP IMAGE*/
            $width  = $this->width;
            $height = $this->height;

            // Starting point of crop
            $img_width = imagesx($sourceImage);
            $img_height = imagesy($sourceImage);

            if ($img_width <= $img_height) {
                // Adjust crop size if the image is height
                $crop_width = $crop_height = $img_width;
                $tlx = $tly = 0;
            } else {
                $crop_width = $crop_height = $img_height;
                $tlx = floor($img_width / 2) - floor ($crop_width / 2);
                $tly = floor($img_height / 2) - floor($crop_height / 2);
            }

            // Adjust crop size if the image is too small
            if ($tlx < 0)
            {
              $tlx = 0;
            }
            if ($tly < 0)
            {
              $tly = 0;
            }
            $outputImage = imagecreatetruecolor($width, $height);
            imagefilledrectangle($outputImage, 0, 0, $width, $height, 0xffffff);
            $this->setTransparent($outputImage, $sourceImage);
            imagecopyresampled($outputImage, $sourceImage, 0, 0, $tlx, $tly, $width, $height, $crop_width, $crop_height);
            /*END CROP IMAGE*/
        } else {
            $outputImage = imagecreatetruecolor($output[0], $output[1]);
            imagefilledrectangle($outputImage, 0, 0, $output[0], $output[1], 0xffffff);
            $this->setTransparent($outputImage, $sourceImage);
            imagecopyresampled($outputImage, $sourceImage, 0, 0, 0, 0, $output[0], $output[1], $source[0], $source[1]);
        }

        if ($border) {
            //exit();
            $ox = imagesx($outputImage);
            $oy = imagesy($outputImage);
            //var_dump($ow); exit();
            $img_adj_width = $ox - 2;
            $img_adj_height = $oy - 2;

            $outputImage_border = imagecreatetruecolor($ox, $oy);
            $border_color = imagecolorallocate($outputImage_border, 204, 204, 204);
            imagefilledrectangle($outputImage_border, 0, 0, $ox, $oy, $border_color);
            imagecopyresampled($outputImage_border, $outputImage, 1, 1, 0, 0, $img_adj_width, $img_adj_height, $ox, $oy);

            $this->outputImage = $outputImage_border;
        } else {
            $this->outputImage = $outputImage;
        }

        return $info;
    }

    protected function isNeedConvertFormat($format)
    {
        return (bool)($this->format !== $format);
    }

    protected function calcOutputImageSize(array $source, array $want)
    {
        list($sw, $sh) = $source;
        list($ww, $wh) = $want;

        if (!$ww)
        {
            $ww = $sw;
        }
        if (!$wh)
        {
            $wh = $sh;
        }

        if (!$this->checkSizeAllowed($ww, $wh))
        {
            $ww = $this->width = $sw;
            $wh = $this->height = $sh;
        }

        $ow = $sw;
        $oh = $sh;

        if ($ww < $sw)
        {
            $ow  = $ww;
            $oh = $sh * $ww / $sw;
        }
        if ($wh < $oh && $wh < $sh)
        {
            $ow  = $sw * $wh / $sh;
            $oh = $wh;
        }
        if (!$ow)
        {
            $ow = 1;
        }
        if (!$oh)
        {
            $oh = 1;
        }

        return array($ow, $oh);
    }

    protected function isNeedResize(array $source, array $output)
    {
        list($sw, $sh) = $source;
        list($ow, $oh) = $output;

        if (!$ow && !$oh)
        {
            return false;
        }
        if (!$sw || !$sh)
        {
            return true;
        }
        if ($sw <= $ow && $sh <= $oh)
        {
            return false;
        }

        return true;
    }

    protected function setTransparent(&$outputImage, &$sourceImage)
    {
        if ($this->format !== 'gif' && $this->format !== 'png')
        {
            return null;
        }

        $sourceIndex = imagecolortransparent($sourceImage);

        // a transparent color exists in the source index
        if ($sourceIndex >= 0)
        {
            imagetruecolortopalette($outputImage, true, 256);

            // gets a transparent color from the source image
            $transparentColor = imagecolorsforindex($sourceImage, $transparentIndex);

            // sets a transparent color to the output image
            imagecolorset($sourceImage, 0, $transparentColor['red'], $transparentColor['green'], $transparentColor['blue']);
            imagefill($outputImage, 0, 0, 0);
            imagecolortransparent($outputImage, 0);
        }
        elseif ($this->format === 'png')
        {
            imagealphablending($outputImage, false);
            imagesavealpha($outputImage, true);

            // sets a transparent color
            $color = imagecolorallocatealpha($outputImage, 0, 0, 0, 127);
            imagefill($outputImage, 0, 0, $color);
        }
    }

    public function getFormat()
    {
        return $this->format;
    }

    protected function checkSizeAllowed($w, $h)
    {
        return in_array($w.'x'.$h, $this->allowedSize);
    }
}
