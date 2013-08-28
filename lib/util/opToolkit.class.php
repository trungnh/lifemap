<?php

/**
 * This file is part of the OpenPNE package.
 * (c) OpenPNE Project (http://www.openpne.jp/)
 *
 * For the full copyright and license information, please view the LICENSE
 * file and the NOTICE file that were distributed with this source code.
 */

/**
 * opToolkit provides basic utility methods for OpenPNE.
 *
 * @package    OpenPNE
 * @subpackage util
 * @author     Kousuke Ebihara <ebihara@tejimaya.com>
 */
class opToolkit {

    /**
     * Returns the list of mobile e-mail address domains.
     *
     * @return array
     */
    public static function getMobileMailAddressDomains() {
        return (array) include(sfContext::getInstance()->getConfigCache()->checkConfig('config/mobile_mail_domain.yml'));
    }

    /**
     * Checks if a string is a mobile e-mail address.
     *
     * @param string
     *
     * @return bool true if $string is valid mobile e-mail address and false otherwise.
     */
    public static function isMobileEmailAddress($string) {
        $pieces = explode('@', $string, 2);
        $domain = array_pop($pieces);

        return in_array($domain, self::getMobileMailAddressDomains());
    }

    /**
     * Takes a text that matched pattern and replaces it to a marker.
     *
     * Replaces text that matched $pattern to a marker.
     * This method returns replaced text and a correspondence table of marker and pre-convert text
     *
     * @param string $subject
     * @param array  $patterns
     *
     * @return array
     */
    public static function replacePatternsToMarker($subject, $patterns = array()) {
        $i = 0;
        $list = array();

        if (empty($patterns)) {
            $patterns = array(
                '/<input[^>]+>/is',
                '/<textarea.*?<\/textarea>/is',
                '/<option.*?<\/option>/is',
                '/<img[^>]+>/is',
                '/<head.*?<\/head>/is',
            );
        }

        foreach ($patterns as $pattern) {
            if (preg_match_all($pattern, $subject, $matches)) {
                foreach ($matches[0] as $match) {
                    $replacement = '<<<MARKER:' . $i . '>>>';
                    $list[$replacement] = $match;
                    $i++;
                }
            }
        }

        $subject = str_replace(array_values($list), array_keys($list), $subject);
        return array($list, $subject);
    }

    public static function isEnabledRegistration($mode = '') {
        $registration = opConfig::get('enable_registration');
        if ($registration == 3) {
            return true;
        }

        if (!$mode && $registration) {
            return true;
        }

        if ($mode == 'mobile' && $registration == 1) {
            return true;
        }

        if ($mode == 'pc' && $registration == 2) {
            return true;
        }

        return false;
    }

    /**
     * Unifys EOL characters in the string.
     *
     * @param string $string
     * @param string $eol
     *
     * @return string
     */
    public static function unifyEOLCharacter($string, $eol = "\n") {
        $eols = array("\r\n", "\r", "\n");
        if (!in_array($eol, $eols)) {
            return $string;
        }

        // first, unifys to LF
        $string = str_replace("\r\n", "\n", $string);
        $string = str_replace("\r", "\n", $string);

        // second, unifys to specify EOL character
        if ($eol !== "\n") {
            $string = str_replace("\n", $eol, $string);
        }

        return $string;
    }

    public static function extractEnclosedStrings($string, $enclosure = '"') {
        $result = array('base' => $string, 'enclosed' => array());
        $enclosureCount = substr_count($string, $enclosure);

        for ($i = 0; $i < $enclosureCount; $i++) {
            $begin = strpos($string, $enclosure);
            $finish = strpos($string, $enclosure, $begin + 1);
            if ($begin !== false && $finish !== false) {
                $head = substr($string, 0, $begin - 1);
                $body = substr($string, $begin + 1, $finish - $begin - 1);
                $foot = substr($string, $finish + 1);

                $string = $head . $foot;
                $result['enclosed'][] = $body;
                $i++;
            }
        }

        $result['base'] = $string;
        return $result;
    }

    public static function generatePasswordString($length = 12, $is_use_mark = true) {
        $result = '';

        $str = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        if ($is_use_mark) {
            $str .= '#$-=?@[]_';
        }

        $range = strlen($str) - 1;

        while ($length > strlen($result)) {
            $result .= $str[rand(0, $range)];
        }

        return $result;
    }

    public static function stripNullByteDeep($value) {
        return is_array($value) ?
                array_map(array('opToolkit', 'stripNullByteDeep'), $value) :
                (is_string($value) ? preg_replace("/[\x{0}-\x{08}\x{0b}-\x{1f}\x{7f}-\x{9f}\x{ad}]/u", '', $value) : $value);
    }

    public static function appendMobileInputModeAttributesForFormWidget(sfWidget $widget, $mode = 'alphabet') {
        $modes = array(
            'hiragana' => 1,
            'hankakukana' => 2,
            'alphabet' => 3,
            'numeric' => 4,
        );

        if (empty($modes[$mode])) {
            return false;
        }

        $widget->setAttribute('istyle', $modes[$mode]);
        $widget->setAttribute('mode', $mode);
    }

    /**
     * This method calculates how many days to go until specified day.
     *
     * @param string $targetDay
     * @return int between from target days.
     */
    public static function extractTargetDay($targetDay) {
        If (!$targetDay) {
            return -1;
        }

        list(, $m, $d) = explode('-', $targetDay);

        $m = (int) $m;
        $d = (int) $d;

        if ($m == 0 || $d == 0) {
            return -1;
        }

        $y = date('Y');

        $today = mktime(0, 0, 0);

        $theday_thisyear = mktime(0, 0, 0, $m, $d, $y);
        $theday_nextyear = mktime(0, 0, 0, $m, $d, $y + 1);

        if ($theday_thisyear < $today) {
            $theday_next = $theday_nextyear;
        } else {
            $theday_next = $theday_thisyear;
        }

        return ($theday_next - $today) / 86400;
    }

    public static function retrieveAPIList($isWithI18n = true) {
        $result = array();

        $context = sfContext::getInstance();
        $config = new sfRoutingConfigHandler();
        $currentApp = sfConfig::get('sf_app');
        $i18n = $context->getI18n();

        sfConfig::set('sf_app', 'api');
        $routing = new sfPatternRouting($context->getEventDispatcher());
        $routing->setRoutes($config->evaluate($context->getConfiguration()->getConfigPaths('config/routing.yml')));
        sfConfig::set('sf_app', $currentApp);

        $context->getEventDispatcher()->notify(new sfEvent($routing, 'routing.load_configuration'));
        $routes = $routing->getRoutes();

        foreach ($routes as $route) {
            if ($route instanceof opAPIRouteInterface) {
                $caption = $route->getAPICaption();

                if ($isWithI18n) {
                    $caption = $i18n->__($caption, null, 'api');
                }

                $result[$route->getAPIName()] = $caption;
            }
        }

        return $result;
    }

    static public function getCultureChoices($cultures) {
        $choices = array();
        foreach ($cultures as $culture) {
            $c = explode('_', $culture);
            try {
                $cultureInfo = sfCultureInfo::getInstance($culture);
                $choices[$culture] = $cultureInfo->getLanguage($c[0]);
                if (isset($c[1])) {
                    $choices[$culture] .= ' (' . $cultureInfo->getCountry($c[1]) . ')';
                }
            } catch (sfException $e) {
                $choices[$culture] = $culture;
            }
        }

        return $choices;
    }

    static public function getPresetProfileList() {
        $configPath = 'config/preset_profile.yml';
        sfContext::getInstance()->getConfigCache()->registerConfigHandler($configPath, 'sfSimpleYamlConfigHandler', array());
        $list = include(sfContext::getInstance()->getConfigCache()->checkConfig($configPath));

        return $list;
    }

    public static function arrayMapRecursive($callback, $array) {
        $result = array();

        foreach ($array as $key => $value) {
            $result[$key] = is_array($value) ? call_user_func(array('opToolkit', 'arrayMapRecursive'), $callback, $value) : call_user_func($callback, $value);
        }

        return $result;
    }

    /**
     * This method file download.
     *
     * @param string $original_filename
     * @param bin $bin
     * @return none binaryFile
     */
    static public function fileDownload($original_filename, $bin) {
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== false) {
            $original_filename = mb_convert_encoding($original_filename, 'SJIS', 'UTF-8');
        }
        $original_filename = str_replace(array("\r", "\n"), '', $original_filename);

        header('Content-Disposition: attachment; filename="' . $original_filename . '"');
        header('Content-Length: ' . strlen($bin));
        header('Content-Type: application/octet-stream');

        echo $bin;
        exit;
    }

    public static function isSecurePage() {
        $context = sfContext::getInstance();
        $action = $context->getActionStack()->getLastEntry()->getActionInstance();
        $credential = $action->getCredential();

        if (sfConfig::get('sf_login_module') === $context->getModuleName()
                && sfConfig::get('sf_login_action') === $context->getActionName()) {
            return false;
        }

        if (sfConfig::get('sf_secure_module') == $context->getModuleName()
                && sfConfig::get('sf_secure_action') == $context->getActionName()) {
            return false;
        }

        if (!$action->isSecure()) {
            return false;
        }

        if ((is_array($credential) && !in_array('SNSMember', $credential))
                || (is_string($credential) && 'SNSMember' !== $credential)) {
            return false;
        }

        return true;
    }

    public static function clearCache() {
        $filesystem = new sfFilesystem();
        $filesystem->remove(sfFinder::type('file')->discard('.sf')->in(sfConfig::get('sf_cache_dir')));
        @$filesystem->remove(sfFinder::type('file')->in(sfConfig::get('sf_web_dir') . '/cache/'));
    }

    /**
     * calculateAge
     */
    public static function calculateAge($birthdayString) {
        $birthdayTime = strtotime($birthdayString);
        if (false === $birthdayTime) {
            return false;
        }

        $thisYear = intval(date('Y'));
        $today = intval(date('nd'));

        $age = $thisYear - date('Y', $birthdayTime);
        if ($today < date('n', $birthdayTime) * 100 + date('d', $birthdayTime))
            $age--;

        return $age;
    }

    public static function createStringDsnFromArray($arrayDsn) {
        $result = array();

        $table = array(
            'host' => 'hostspec',
            'port' => 'port',
            'dbname' => 'database',
            'unix_socket' => 'unix_socket',
        );

        if (!empty($arrayDsn['hostspec'])) {
            $pieces = explode(':', $arrayDsn['hostspec']);

            $arrayDsn['hostspec'] = $pieces[0];
            if (isset($pieces[1])) {
                $arrayDsn['port'] = $pieces[1];
            }
        }

        if (!empty($arrayDsn['protocol']) && !empty($arrayDsn['proto_opts'])) {
            if ('unix' === $arrayDsn['protocol']) {
                $arrayDsn['unix_socket'] = $arrayDsn['proto_opts'];
            }
        }

        foreach ($table as $k => $v) {
            if (isset($arrayDsn[$v])) {
                $result[] = $k . '=' . $arrayDsn[$v];
            }
        }

        return $arrayDsn['phptype'] . ':' . implode(';', $result);
    }

    public static function calculateUsableMemorySize() {
        $limit = trim(ini_get('memory_limit'));
        if ('-1' === $limit) {
            return null;
        }

        $unit = strtolower($limit[strlen($limit) - 1]);
        $units = array(
            'k' => 1,
            'm' => 2,
            'g' => 3,
        );

        if (isset($units[$unit])) {
            $limit *= pow(1024, $units[$unit]);
        }

        $usage = memory_get_usage();

        return ($limit - $usage);
    }

    /**
     * Generates a randomized hash (from Ethna 2.5.0)
     *
     * Licensed under The BSD License. Original is the Ethna_Util::getRandom() method.
     *
     * Copyright (c) 2004-2006, Masaki Fujimoto
     * All rights reserved.
     *
     * @author  Masaki Fujimoto <fujimoto@php.net>
     * @license http://www.opensource.org/licenses/bsd-license.php The BSD License
     *
     * @param  int    $length  Length of a hash
     * @return string
     */
    public function getRandom($length = 64) {
        static $srand = false;

        if ($srand == false) {
            list($usec, $sec) = explode(' ', microtime());
            mt_srand((float) $sec + ((float) $usec * 100000) + getmypid());
            $srand = true;
        }

        // Is the "open_basedir" is on, and accessing to /proc is allowed?
        // If the "open_basedir" is empty, this method consider that accessing to it is allowed.
        $devfile = '/proc/net/dev';
        $open_basedir_conf = ini_get('open_basedir');
        $devfile_enabled = (empty($open_basedir_conf)
                || (preg_match('#:/proc#', $open_basedir_conf) > 0
                || preg_match('#^/proc#', $open_basedir_conf) > 0));

        $value = '';
        for ($i = 0; $i < 2; $i++) {
            // for Linux
            if ($devfile_enabled && file_exists($devfile)) {
                $rx = $tx = 0;
                $fp = fopen($devfile, 'r');
                if ($fp != null) {
                    $header = true;
                    while (feof($fp) === false) {
                        $s = fgets($fp, 4096);
                        if ($header) {
                            $header = false;
                            continue;
                        }
                        $v = preg_split('/[:\s]+/', $s);
                        if (is_array($v) && count($v) > 10) {
                            $rx += $v[2];
                            $tx += $v[10];
                        }
                    }
                }
                $platform_value = $rx . $tx . mt_rand() . getmypid();
            } else {
                $platform_value = mt_rand() . getmypid();
            }
            $now = strftime('%Y%m%d %T');
            $time = gettimeofday();
            $v = $now . $time['usec'] . $platform_value . mt_rand(0, time());
            $value .= md5($v);
        }

        if ($length < 64) {
            $value = substr($value, 0, $length);
        }

        return $value;
    }

    static public function writeCacheFile($pathToCacheFile, $content) {
        $filesystem = new sfFilesystem();

        $currentUmask = umask();
        umask(0000);

        $tmpFile = tempnam(dirname($pathToCacheFile), basename($pathToCacheFile));
        if (!$fp = @fopen($tmpFile, 'wb')) {
            throw new sfCacheException('Failed to write cache file.');
        }

        @fwrite($fp, $content);
        @fclose($fp);
        if (!@rename($tmpFile, $pathToCacheFile)) {
            if ($filesystem->copy($tmpFile, $pathToCacheFile, array('override' => true))) {
                $filesystem->remove($tmpFile);
            }
        }

        $filesystem->chmod($pathToCacheFile, 0666);
        umask($currentUmask);
    }

    /*
     *  @author: tuent
     *  convert a position to array
     */

    public static function apiConvertPosToArray(Pos $pos) {
        $output = array();

        $output['title'] = $pos->getTitle();
        $output['address'] = $pos->getAddress();
        $output['tel'] = $pos->getTel();
        $output['lat'] = $pos->getLat();
        $output['lng'] = $pos->getLng();
        $output['file_id'] = $pos->getImageFileName();


        return $output;
    }

    /*
     *  @author: tuent
     *  convert a position to json
     */

    public static function apiConvertPosToJson(Pos $pos) {
        return json_encode(array(self::apiConvertPosToArray($pos)));
    }

    /*
     * Hàm curl
     * @author: thuclh
     */

    public static function _curl($url, $post = "", $refer = "", $usecookie = false) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        if ($post) {
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
        }
        if ($refer) {
            curl_setopt($ch, CURLOPT_REFERER, $refer);
        }
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/6.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.7) Gecko/20050414 Firefox/1.0.3");
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        if ($usecookie) {
            curl_setopt($ch, CURLOPT_COOKIEJAR, $usecookie);
            curl_setopt($ch, CURLOPT_COOKIEFILE, $usecookie);
        }
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

    /*
     *  Get info flow from google
     * @author: thuclh
     */

    public static function getInfoGoogleFlow($url) {
        return self::_curl($url, '', 'http://maps.google.com');
    }

    /*
     *  Get pos from content
     * @author: thuclh
     */

    public static function getPosFromContent($html, & $poslist) {
        preg_match('/markers:(.*?),layers:/', $html, $arr);
        $listKey = array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J");
        foreach ($listKey as $id => $key) {
            $pos = array();
            $googlePos = new PosGoogle();
            $nextkey = $listKey[$id + 1];
            if ($nextkey) {
                $pattent = '/{id:"' . $key . '"(.*?),{id:"' . $nextkey . '"/';
                preg_match($pattent, $arr[1], $arr1);
                $key_pos = '{id:"' . $key . '"' . $arr1[1];
            } else {
                $pattent = '/{id:"' . $key . '"(.*?)}]$/';
                preg_match($pattent, $arr[1], $arr1);
                $key_pos = '{id:"' . $key . '"' . $arr1[1];
            }
            //get cid
            preg_match('/cid:"(.*?)",/', $key_pos, $cid);
            $pos['cid'] = $cid[1];
            // get lat, lng
            if ($pos['cid']) {
//                error_log($pos['cid']);
                preg_match('/latlng:{(.*?)},/', $key_pos, $latlng);
                preg_match('/lat:(.*?),/', $latlng[1], $lat);
                $pos['lat'] = $lat[1];
                preg_match('/lng:(.*?)$/', $latlng[1], $lng);
                $pos['lng'] = $lng[1];
                //get name
                preg_match('/name:"(.*?)",/', $key_pos, $name);
                $pos['title'] = $name[1];
                // get address
                preg_match('/addressLines:[[]"(.*?)[]],/', $key_pos, $address);
                $pos['address'] = $address[1];
                //get phone
                preg_match('/number:"(.*?)"/', $key_pos, $phone);
                $pos['tel'] = $phone[1];
                //get place url
                preg_match('/place_url:"(.*?)",/', $key_pos, $placeurl);
                $pos['place_url'] = $placeurl[1];
                //get photo url
                preg_match('/photoUrl:"(.*?)",/', $key_pos, $photourl);
                $pos['image_url'] = $photourl[1];
                //get cat
                preg_match('/cat2:(.*?)},/', $key_pos, $cat);
                preg_match('/name:"(.*?)",/', $cat[1], $catname);
                $pos['tags'] = $catname[1];
                $poslist[$pos['cid']] = $pos;
            }
        }
    }

    /*
     *  Get content flow from google
     * @author: thuclh
     */

    public static function getContentGoogleFlow($url) {
        $html = self::_curl($url, '', 'http://maps.google.com');
        preg_match('/markers:(.*?),layers:/', $html, $arr);
        $listKey = array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J");
        foreach ($listKey as $id => $key) {
            $googlePos = new PosGoogle();
            $nextkey = $listKey[$id + 1];
            if ($nextkey) {
                $pattent = '/{id:"' . $key . '"(.*?),{id:"' . $nextkey . '"/';
                preg_match($pattent, $arr[1], $arr1);
                $key_pos = '{id:"' . $key . '"' . $arr1[1];
            } else {
                $pattent = '/{id:"' . $key . '"(.*?)}]$/';
                preg_match($pattent, $arr[1], $arr1);
                $key_pos = '{id:"' . $key . '"' . $arr1[1];
            }
            //get cid
            preg_match('/cid:"(.*?)",/', $key_pos, $cid);
            $googlePos->cid = $cid[1];
            if (!$googlePos->checkCID()) {
                // get lat, lng
                preg_match('/latlng:{(.*?)},/', $key_pos, $latlng);
                preg_match('/lat:(.*?),/', $latlng[1], $lat);
                $googlePos->lat = $lat[1];
                preg_match('/lng:(.*?)$/', $latlng[1], $lng);
                $googlePos->lng = $lng[1];
                //get name
                preg_match('/name:"(.*?)",/', $key_pos, $name);
                $googlePos->title = $name[1];
                // get address
                preg_match('/addressLines:[[]"(.*?)[]],/', $key_pos, $address);
                $googlePos->address = $address[1];
                //get phone
                preg_match('/number:"(.*?)"/', $key_pos, $phone);
                $googlePos->tel = $phone[1];
                //get place url
                preg_match('/place_url:"(.*?)",/', $key_pos, $placeurl);
                $googlePos->place_url = $placeurl[1];
                //get photo url
                preg_match('/photoUrl:"(.*?)",/', $key_pos, $photourl);
                $googlePos->image_url = $photourl[1];
                //get cat
                preg_match('/cat2:(.*?)},/', $key_pos, $cat);
                preg_match('/name:"(.*?)",/', $cat[1], $catname);
                $googlePos->tags = $catname[1];
                error_log($googlePos->title);
                $googlePos->save();
            }
        }
    }

    public static function getGrid($lat = 21.011124337539744, $lng = 105.83893784118652, $radius = 0.82, $url = null, $area_radius = 20) {
        $url = $url ? $url : 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=centerhere&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=radiushere&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA';
        $latlng = array($lat, $lng);
        $latlist = array();
        $url_new = preg_replace(array('/centerhere/', '/radiushere/'), array($lat . ',' . $lng, $radius . ''), $url);
        $latlist[] = array('lat' => $lat, 'lng' => $lng, 'url' => $url_new);
        $diameter = 2 * $radius;
        for ($i = $diameter; $i <= $area_radius; $i+=$diameter) {
            //get list same lat
            $lat1 = $lat;
            $listlng = self::getPosLngSameLatByDistance($lat, $lng, $i);
            foreach ($listlng as $lng1) {
                $url_new = preg_replace(array('/centerhere/', '/radiushere/'), array($lat1 . ',' . $lng1, $radius . ''), $url);
                $latlist[] = array('lat' => $lat1, 'lng' => $lng1, 'url' => $url_new);
            }
        }

        foreach ($latlist as $latpos) {
            for ($i = $diameter; $i <= $area_radius; $i+=$diameter) {
                //get list same lat
                $lng1 = $latpos['lng'];
                $listlat = self::getPosLatSameLngByDistance($latpos['lat'], $latpos['lng'], $i);
                foreach ($listlat as $lat1) {
                    $url_new = preg_replace(array('/centerhere/', '/radiushere/'), array($lat1 . ',' . $lng1, $radius . ''), $url);
                    $latlist[] = array('lat' => $lat1, 'lng' => $lng1, 'url' => $url_new);
                }
            }
        }
        return $latlist;
    }

    public static function getGridNew($config) {
        $lat = floatval($config['lat']);
        $lng = floatval($config['lng']);
        $radius = floatval($config['radius']);
        $url = $config['url'] ? $config['url'] : 'http://maps.google.com/maps?f=q&source=s_q&hl=vi&q=keywordhere&aq=&sll=centerhere&sspn=0.010735,0.021136&vpsrc=6&ie=UTF8&t=m&st=109146043351405611748&rq=1&ev=zi&split=1&z=16&jsv=387c&mpnum=1000&radius=radiushere&vps=10&output=js&ei=yi4NT5PdHfHJmQXkuLG_DA';
        $area = $config['area'];
        $radius_area = $config['radius_area'];
        $status = $config['status'];


        $latlng = array($lat, $lng);
        $latlist = array();
        $url_new = preg_replace(array('/centerhere/', '/radiushere/'), array($lat . ',' . $lng, $radius . ''), $url);

        $latlist[] = array(
            'lat' => $lat,
            'lng' => $lng,
            'radius' => $radius,
            'url' => $url_new,
            'area' => $area,
            'radius_area' => $radius_area,
            'status' => $status);

        $diameter = 2 * $radius;
        for ($i = $diameter; $i <= $radius_area; $i+=$diameter) {
            //get list same lat
            $lat1 = $lat;
            $listlng = self::getPosLngSameLatByDistance($lat, $lng, $i);
            foreach ($listlng as $lng1) {
                $url_new = preg_replace(array('/centerhere/', '/radiushere/'), array($lat1 . ',' . $lng1, $radius . ''), $url);
                $latlist[] = array(
                    'lat' => $lat1,
                    'lng' => $lng1,
                    'radius' => $radius,
                    'url' => $url_new,
                    'area' => $area,
                    'radius_area' => $radius_area,
                    'status' => $status);
            }
        }

        foreach ($latlist as $latpos) {
            for ($i = $diameter; $i <= $radius_area; $i+=$diameter) {
                //get list same lat
                $lng1 = $latpos['lng'];
                $listlat = self::getPosLatSameLngByDistance($latpos['lat'], $latpos['lng'], $i);
                foreach ($listlat as $lat1) {
                    $url_new = preg_replace(array('/centerhere/', '/radiushere/'), array($lat1 . ',' . $lng1, $radius . ''), $url);
                    $latlist[] = array(
                        'lat' => $lat1,
                        'lng' => $lng1,
                        'radius' => $radius,
                        'url' => $url_new,
                        'area' => $area,
                        'radius_area' => $radius_area,
                        'status' => $status);
                }
            }
        }
        return $latlist;
    }

    /**
     * Hàm tính khoảng cách 2 điểm
     *
     * @author thuclh
     */
    public static function distance_haversine($lat1, $lon1, $lat2, $lon2) {
        $distance = 111.1736937253606 * sqrt(($lat2 - $lat1) * ($lat2 - $lat1) + cos($lat2 / 57.29578) * cos($lat1 / 57.29578) * ($lon2 - $lon1) * ($lon2 - $lon1));
        return $distance;
    }

    /**
     * Hàm lấy 2 điểm cùng lat, cách một khoảng distance
     *
     * @author thuclh
     */
    public static function getPosLngSameLatByDistance($lat1, $lon1, $distance) {
        return array($lon1 + $distance / 111.1736937253606 / cos($lat1 / 57.29578), $lon1 - $distance / 111.1736937253606 / cos($lat1 / 57.29578));
    }

    /**
     * Hàm lấy 2 điểm cùng lng, cách một khoảng distance
     *
     * @author thuclh
     */
    public static function getPosLatSameLngByDistance($lat1, $lon1, $distance) {
        return array($lat1 + $distance / 111.1736937253606, $lat1 - $distance / 111.1736937253606);
    }

    /**
     * Hàm lấy ảnh từ url vào hệ thống
     *
     * @author thuclh
     */
    public static function getImageToFile($image_url) {
        $image_name = md5($image_url . date('ymdhsu') . (Math . rand(0, 1000))) . "_jpg";
        $file = new File();
        $file->type = 'image/jpeg';
        $file->save();
        $file->name = "p_" . $file->getId() . "_" . PosTable::pos_member_lifemap . "_" . $image_name;
        $file->save();
        $img = 'images/data/' . $file->name . '.jpg';
        file_put_contents($img, file_get_contents(str_ireplace('https', 'http', $image_url)));
        error_log($file->name);
        return $file;
    }

    /*
     *  Get info flow from google
     * @author: thuclh
     */

    public static function getContentWeb($url) {
        return file_get_contents($url);
    }

    /*
     *  Get pos from content
     * @author: thuclh
     */

    public static function getPosFromVnExpress($url, $date) {
        $content = file_get_contents($url);
        $content = ereg_replace("\n", "", $content);
        preg_match_all('@<li class="level2_(.*?)</li>@', $content, $listpos, PREG_SET_ORDER);
        $poses = array();
        foreach ($listpos as $pos_html) {
            $pos = array();
            $pos_content = $pos_html[0];
            preg_match('@html">(.*?)</a>@', $pos_content, $a_title);
            $pos['title'] = trim($a_title[1]);
            preg_match('@/rao-vat/(.*?)html@', $pos_content, $a_tag);
            $pos['url'] = 'http://vnexpress.net' . $a_tag[0];
            preg_match('@cho-thue-nha-dat/(.*?)-@', $pos['url'], $a_cid);
            $pos['cid'] = $a_cid[1];
            preg_match('@<div class="dateRV">(.*?)</div>@', $pos_content, $a_date);
            $pos['date'] = trim($a_date[1]);
            if ($pos['date'] == $date) {
                $poses[] = $pos;
            }
        }
        return $poses;
    }

    /*
     *  Get pos from content
     * @author: thuclh
     */

    public static function getPosContentFromVnExpress($url) {
        $content = file_get_contents($url);
        $content = ereg_replace("\n", "", $content);
        $pos = array();
        preg_match('@<div class="des_ct" style="#padding-top: 10px;">(.*?)</div>@', $content, $title);
        $pos['description'] = $title[1];
        preg_match('@<div class="div_contact">(.*?)</div>@', $content, $title);
        $pos['contact'] = $title[1];
        preg_match('@<h1 class="title_rv">(.*?)</h1>@', $content, $title);
        $pos['title'] = $title[1];
        return $pos;
    }

    static public function slugify($text) {
        // replace all non letters or digits by -
        $text = preg_replace('/\W+/', '-', $text);

        // trim and lowercase
        $text = strtolower(trim($text, '-'));

        return $text;
    }

    public static function expansionAreaSearch($position, $r = 17) {
        $latCenter = ($position['min_lat'] + $position['max_lat']) / 2;
        $lngCenter = ($position['min_lng'] + $position['max_lng']) / 2;
        $lat = opToolkit::getPosLatSameLngByDistance($latCenter, $lngCenter, $r);
        $lng = opToolkit::getPosLngSameLatByDistance($latCenter, $lngCenter, $r);
        $position = array(
            'min_lat' => $lat[1],
            'max_lat' => $lat[0],
            'min_lng' => $lng[1],
            'max_lng' => $lng[0],
        );
        return $position;
    }

    /**
     * Convert từ tiếng việt thành ko dấu và dấu -
     *
     * @thuclh
     */
    public static function convertUrlVietNamese($str) {
        $str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
        $str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
        $str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
        $str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
        $str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
        $str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
        $str = preg_replace("/(đ)/", 'd', $str);
        $str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", 'A', $str);
        $str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", 'E', $str);
        $str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", 'I', $str);
        $str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", 'O', $str);
        $str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", 'U', $str);
        $str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", 'Y', $str);
        $str = preg_replace("/(Đ)/", 'D', $str);
        $str = str_replace(" ", "-", str_replace("&*#39;", "", $str));
        return $str;
    }

    /**
     * Hàm lấy mảng các config của deal
     * thuclh
     */
    public static function getPosDealConfig() {
        return (array) include(sfContext::getInstance()->getConfigCache()->checkConfig('config/pos_deal.yml'));
    }

    /**
     * Hàm lấy mảng provinces của Deal
     * thuclh
     */
    public static function getDealProvinces() {
        $dealconfig = self::getPosDealConfig();
        return $dealconfig['provinces'];
    }

    /**
     * Hàm lấy mảng source của Deal
     * thuclh
     */
    public static function getDealSources() {
        $dealconfig = self::getPosDealConfig();
        return $dealconfig['sources'];
    }

    /**
     * Hàm lấy mảng status của Deal
     * thuclh
     */
    public static function getDealStatuses() {
        $dealconfig = self::getPosDealConfig();
        return $dealconfig['statuses'];
    }

    /**
     * Hàm lấy mảng status của Deal
     * thuclh
     */
    public static function getDealOrderes() {
        $dealconfig = self::getPosDealConfig();
        return $dealconfig['orderes'];
    }

}

?>