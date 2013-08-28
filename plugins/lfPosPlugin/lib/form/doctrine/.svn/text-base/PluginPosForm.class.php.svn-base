<?php

/**
 * PluginPos form.
 *
 * @package    ##PROJECT_NAME##
 * @subpackage form
 * @author     ##AUTHOR_NAME##
 * @version    SVN: $Id: sfDoctrineFormPluginTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
abstract class PluginPosForm extends BasePosForm
{
    public function setup() {
        parent::setup();

        unset($this['id']);
        unset($this['created_at']);
        unset($this['updated_at']);
        if($this->getObject()->getPosCategory()){
            $subcategories = Doctrine::getTable("PosCategory")->getSubCategories($this->getObject()->getPosCategory()->getId());
            $array_subs = array();
            foreach ($subcategories as $subcategory) {
                $array_subs[$subcategory->id] = $subcategory->name;

            }
            $this->widgetSchema['pos_sub_category_id'] = new sfWidgetFormSelect(array('choices' => $subcategories));
        }
    }
}
