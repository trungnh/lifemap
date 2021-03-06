<?php
// auto-generated by sfViewConfigHandler
// date: 2012/03/28 02:21:24
$response = $this->context->getResponse();


  $templateName = sfConfig::get('symfony.view.'.$this->moduleName.'_'.$this->actionName.'_template', $this->actionName);
  $this->setTemplate($templateName.$this->viewName.$this->getExtension());



  if (null !== $layout = sfConfig::get('symfony.view.'.$this->moduleName.'_'.$this->actionName.'_layout'))
  {
    $this->setDecoratorTemplate(false === $layout ? false : $layout.$this->getExtension());
  }
  else if (null === $this->getDecoratorTemplate() && !$this->context->getRequest()->isXmlHttpRequest())
  {
    $this->setDecoratorTemplate('' == 'layoutC' ? false : 'layoutC'.$this->getExtension());
  }
  $response->addHttpMeta('content-type', 'text/html', false);
  $response->addMeta('description', 'Bản đồ cuộc sống - LifeMap.vn. LifeMap là một tiện ích mang tính xã hội để kết nối các địa điểm với nhau.Xem bản đồ và tìm kiếm nhà cho thuê, cafe, nhà hàng, quán bia, trường học, cửa hàng, nhà nghỉ, khách sạn.', false, false);
  $response->addMeta('keywords', 'lifemap.vn, bản đồ, địa điểm, nhà cho thuê, tìm kiếm địa điểm, tìm kiếm nhà cho thuê, tìm kiếm theo bản đồ, chia sẻ địa điểm, kết nối người dùng  - địa điểm', false, false);
  $response->addMeta('language', 'vi-VN', false, false);
  $response->addMeta('robots', 'index, follow', false, false);

  $response->addStylesheet('/opSkinBasicPlugin/css/main.css', '', array ());
  $response->addStylesheet('/opSkinBasicPlugin/css/colorbox', '', array ());
  $response->addJavascript('/opSkinBasicPlugin/js/jquery/jquery-1.7.min.js', '', array ());
  $response->addJavascript('/opSkinBasicPlugin/js/jquery/jquery.colorbox.js', '', array ());
  $response->addJavascript('/opSkinBasicPlugin/js/jquery/jquery.cookies.js', '', array ());
  $response->addJavascript('/opSkinBasicPlugin/js/all', '', array ());


// auto-generated by opViewConfigHandler
// date: 2012/03/28 02:21:24



