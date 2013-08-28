<?php

/**
 * PluginPosCategoryTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class PluginPosCategoryTable extends Doctrine_Table {

    const rent_house_code = "pos_rent_house";
    const category_public = 1; // loai hi?n th? public
    const category_private = 0;  // loai c

    const view_in_list = 1;  // hien thi o list category phan tim kiem
    const no_view_in_list = 0;  // hien thi o list category phan tim kiem

    const deal_code = "pos_deal";
    /**
     * Returns an instance of this class.
     *
     * @return object PluginPosCategoryTable
     */

    public static function getInstance() {
        return Doctrine_Core::getTable('PluginPosCategory');
    }

    public function getAllParentCategories() {
        $q = $this->createQuery()
                ->where('parent_id is ?', NULL)
                ->andWhere('type <> ?', 0);

        return $q->fetchArray();
    }

    /* Danh sách các địa điểm thường */

    public function getAllCategories() {
        $q = $this->createQuery()
                ->where('type=', self::category_public);
        return $q->fetchArray();
    }

    public function getCategoryFromCode($code) {
        $q = $this->createQuery()
                ->where('code = ?', $code);
        return $q->fetchOne();
    }

    public function getSubCategories($parentId) {
        $q = $this->createQuery()
                ->where('parent_id = ?', $parentId)
                ->orderBy('order asc');
        return $q->execute();
    }

    public function getTableNameOfCategory($categoryId) {
        return $this->createQuery()
                        ->where('id = ?', $categoryId)
                        ->andWhere('type =?', self::category_private)
                        ->fetchOne();
    }

    /*
     * tuent
     * l?y h?t c�c sub categories c?a m?t parent category n�o d� theo parent_category
     */

    public function getRentHouseSubCategories() {
        // l?y id c?a category t�n rent house
        $q1 = $this->createQuery('parent')
                ->where('parent.code = ?', self::rent_house_code);

        $parent = $q1->fetchOne();
        $parent_id = $parent->getId();

        // tim c�c sub categories c?a rent house th�ng qua id
        $q2 = $this->createQuery('sub')
                ->where('sub.parent_id = ?', $parent_id);

        return $q2->fetchArray();
    }

    /*
     * tuent
     * l?y id c?a m?t category cha
     */

    public function getParentCategoryId($category_code) {
        $q1 = $this->createQuery('parent')
                ->where('parent.code = ?', $category_code);

        $parent = $q1->fetchOne();
        return $parent->getId();
    }

    /**
     * Get Code to new google flow
     * 
     * @author thuclh
     */
    public function getListCategoryCode() {
        $q = $this->createQuery();
        $listcategory = $q->execute();
        $code = array();
        foreach ($listcategory as $category) {
            $code[$category->code] = $category->name;
        }
        return $code;
    }

    /* tuent
     * tra ve name, id, code cua cac categories ko phai nha cho thue
     */

    public function getMiniCategories() {
        $q = $this->createQuery('c')
                ->select('c.name, c.code, c.id')
                ->where('type=', self::category_public)
                ->andWhere('view_flag=',self::view_in_list)
                ->orderBy("order");
        return $q->fetchArray();
    }
    
    /**
     *tuent
     *  lấy category_id theo code
     */
    public function getCategoryIdByCode($category_code) {
        $q = $this->createQuery('c')
                ->where('c.code = ?', $category_code);
        $category = $q->fetchOne();
        
        return $category?$category->getId():0;
    }
}