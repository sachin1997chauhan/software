/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.26
 * Generated at: 2022-01-24 06:27:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(7);
    _jspx_dependants.put("jar:file:/C:/Program%20Files/Apache%20Software%20Foundation/Tomcat%209.0/webapps/nms/WEB-INF/lib/spring-webmvc-4.2.5.RELEASE.jar!/META-INF/spring.tld", Long.valueOf(1456342892000L));
    _jspx_dependants.put("jar:file:/C:/Program%20Files/Apache%20Software%20Foundation/Tomcat%209.0/webapps/nms/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153365282000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1613975774000L));
    _jspx_dependants.put("/WEB-INF/lib/spring-security-taglibs-4.2.3.RELEASE.jar", Long.valueOf(1613975776000L));
    _jspx_dependants.put("jar:file:/C:/Program%20Files/Apache%20Software%20Foundation/Tomcat%209.0/webapps/nms/WEB-INF/lib/spring-security-taglibs-4.2.3.RELEASE.jar!/META-INF/security.tld", Long.valueOf(1496875852000L));
    _jspx_dependants.put("/WEB-INF/lib/spring-webmvc-4.2.5.RELEASE.jar", Long.valueOf(1613973102000L));
    _jspx_dependants.put("jar:file:/C:/Program%20Files/Apache%20Software%20Foundation/Tomcat%209.0/webapps/nms/WEB-INF/lib/spring-webmvc-4.2.5.RELEASE.jar!/META-INF/spring-form.tld", Long.valueOf(1456342892000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fform_005fform_0026_005fstyle_005fname_005fmodelAttribute_005fmethod_005fclass_005faction;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fform_005fform_0026_005fmethod_005fid_005faction;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fform_005fform_0026_005fstyle_005fname_005fmodelAttribute_005fmethod_005fclass_005faction = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fform_005fform_0026_005fmethod_005fid_005faction = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fform_005fform_0026_005fstyle_005fname_005fmodelAttribute_005fmethod_005fclass_005faction.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fform_005fform_0026_005fmethod_005fid_005faction.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n\r\n\r\n\r\n\r\n");
      out.write("\r\n<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n<title>Login</title>\r\n<meta charset=\"UTF-8\">\r\n\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n\r\n<!--===============================================================================================-->\r\n<link rel=\"icon\" type=\"image/png\"\r\n\thref=\"resources/images/icons/favicon.ico\" />\r\n<!--===============================================================================================-->\r\n<link rel=\"stylesheet\" type=\"text/css\"\r\n\thref=\"resources/vendor/bootstrap/css/bootstrap.min.css\">\r\n<!--===============================================================================================-->\r\n<link rel=\"stylesheet\" type=\"text/css\"\r\n\thref=\"resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css\">\r\n<!--===============================================================================================-->\r\n<link rel=\"stylesheet\" type=\"text/css\"\r\n\thref=\"resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css\">\r\n<!--===============================================================================================-->\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"\r\n\thref=\"resources/vendor/animate/animate.css\">\r\n<!--===============================================================================================-->\r\n<link rel=\"stylesheet\" type=\"text/css\"\r\n\thref=\"resources/vendor/css-hamburgers/hamburgers.min.css\">\r\n<!--===============================================================================================-->\r\n<link rel=\"stylesheet\" type=\"text/css\"\r\n\thref=\"resources/vendor/animsition/css/animsition.min.css\">\r\n<!--===============================================================================================-->\r\n<link rel=\"stylesheet\" type=\"text/css\"\r\n\thref=\"resources/vendor/select2/select2.min.css\">\r\n<!--===============================================================================================-->\r\n<link rel=\"stylesheet\" type=\"text/css\"\r\n\thref=\"resources/vendor/daterangepicker/daterangepicker.css\">\r\n<!--===============================================================================================-->\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/util.css\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/main.css\">\r\n<!--===============================================================================================-->\r\n\r\n<style type=\"text/css\">\r\n.css-form input.ng-invalid.ng-touched {\r\n\tbackground-color: #FA787E;\r\n}\r\n\r\n.css-form input.ng-valid.ng-touched {\r\n\tbackground-color: #78FA89;\r\n}\r\n\r\n#siginButton {\r\n\tcolor: #fff !important;\r\n\tbackground-color: #1395f0;\r\n\tborder-color: #f2f2f2;\r\n\twidth: 40%;\r\n\ttext-align: center;\r\n\tborder-radius: 7px !important;\r\n\tmargin-top: 7px;\r\n}\r\n\r\nform\r\n\r\n\r\ninput\r\n\r\n.ng-invalid\r\n\r\n\r\n:not\r\n\r\n\r\n\r\n(\r\n.ng-pristine\r\n\r\n)\r\n{\r\nbox-shadow\r\n\r\n:\r\n\r\n\r\n0\r\npx\r\n\r\n\r\n0\r\npx\r\n\r\n\r\n13\r\npx\r\n\r\nrgba\r\n\r\n(255\r\n,\r\n133,\r\n0,\r\n0\r\n.9\r\n\r\n);\r\n}\r\ninput[type=text] {\r\n\tbackground: transparent;\r\n\tborder: none;\r\n\tborder-bottom: 1.5px solid #04586d;\r\n}\r\n\r\ninput[type=text]:focus {\r\n\tbackground: transparent;\r\n}\r\n\r\ninput[type=password] {\r\n\tbackground: transparent;\r\n\tborder: none;\r\n\tborder-bottom: 1.5px solid #04586d;\r\n}\r\n\r\ninput[type=password]:focus {\r\n\tbackground: transparent;\r\n");
      out.write("}\r\n\r\n.input-group {\r\n\tpadding-left: 25px;\r\n\tpadding-right: 25px;\r\n}\r\n\r\n.btn1 {\r\n\twidth: 270px;\r\n\tborder-radius: 15px;\r\n}\r\n</style>\r\n\r\n</head>\r\n<body data-ng-app=\"\">\r\n\r\n\t<div class=\"limiter\">\r\n\t\t<div class=\"container-login100\"\r\n\t\t\tstyle=\"background-image: url('resources/images/bg-01.png');\">\r\n\r\n\t\t\t<div>\r\n\r\n\t\t\t\t<!--    -->\r\n\t\t\t\t");
      out.write("\r\n\t\t\t\t");
      if (_jspx_meth_form_005fform_005f0(_jspx_page_context))
        return;
      out.write("\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t</div>\r\n\r\n\t<!--modal-->\r\n\r\n\r\n\t<div id=\"pwdModal\" class=\"modal fade\" tabindex=\"-1\" role=\"dialog\"\r\n\t\taria-hidden=\"true\">\r\n\t\t<div class=\"modal-dialog\">\r\n\t\t\t<div class=\"modal-content\">\r\n\t\t\t\t<div class=\"modal-header\">\r\n\t\t\t\t\t<div class=\"col-md-12\">\r\n\t\t\t\t\t\t<div class=\"panel panel-default\">\r\n\t\t\t\t\t\t\t<div class=\"panel-body\">\r\n\t\t\t\t\t\t\t\t<div class=\"text-center\">\r\n\r\n\t\t\t\t\t\t\t\t\t<p>If you have forgotten your password you can reset it\r\n\t\t\t\t\t\t\t\t\t\there.</p>\r\n\t\t\t\t\t\t\t\t\t<br>\r\n\t\t\t\t\t\t\t\t\t<!-- \r\n\t\t\t\t\t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\"\r\n\t\t\t\t\t\t\t\t\t\t\taria-hidden=\"true\">×</button> -->\r\n\r\n\t\t\t\t\t\t\t\t\t<div class=\"panel-body\">\r\n\r\n\r\n\t\t\t\t\t\t\t\t\t\t");
      if (_jspx_meth_form_005fform_005f1(_jspx_page_context))
        return;
      out.write("\r\n\t\t\t\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t</div>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class=\"modal-footer\">\r\n\t\t\t\t\t<div class=\"col-md-12-right\">\r\n\t\t\t\t\t\t<button class=\"btn btn-default\" data-dismiss=\"modal\"\r\n\t\t\t\t\t\t\taria-hidden=\"true\">Cancel</button>\r\n\t\t\t\t\t</div>\r\n\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t</div>\r\n\r\n\t<script type=\"text/javascript\">\r\n\t\tjQuery(function($) {\r\n\r\n\t\t\t$(\"#forgot\").submit(\r\n\t\t\t\t\tfunction(e) {\r\n\r\n\t\t\t\t\t\te.preventDefault();\r\n\r\n\t\t\t\t\t\t$form = $(this);\r\n\r\n\t\t\t\t\t\t$.post(\"forgot.htm\", $(this).serialize(),\r\n\t\t\t\t\t\t\t\tfunction(data) {\r\n\t\t\t\t\t\t\t\t\t$feedback = $(\"<div>\").html(data).find(\r\n\t\t\t\t\t\t\t\t\t\t\t\".form-feedback\").hide();\r\n\r\n\t\t\t\t\t\t\t\t\t$form.prepend($feedback);\r\n\t\t\t\t\t\t\t\t\t$feedback.fadeIn(500);\r\n\t\t\t\t\t\t\t\t});\r\n\r\n\t\t\t\t\t});\r\n\t\t});\r\n\t</script>\r\n\r\n\r\n\r\n\t<script type=\"text/javascript\">\r\n\t\tfunction spinner() {\r\n\t\t\t$('.modal').modal('show');\r\n\t\t\tsetTimeout(function() {\r\n\t\t\t\tconsole.log('hejsan');\r\n\t\t\t\t$('.modal').modal('hide');\r\n\t\t\t}, 5000);\r\n\t\t}\r\n\t</script>\r\n\r\n\t<!--===============================================================================================-->\r\n");
      out.write("\t<script src=\"resources/vendor/jquery/jquery-3.2.1.min.js\"></script>\r\n\t<!--===============================================================================================-->\r\n\t<script src=\"resources/vendor/animsition/js/animsition.min.js\"></script>\r\n\t<!--===============================================================================================-->\r\n\t<script src=\"resources/vendor/bootstrap/js/popper.js\"></script>\r\n\t<script src=\"resources/vendor/bootstrap/js/bootstrap.min.js\"></script>\r\n\t<!--===============================================================================================-->\r\n\t<script src=\"resources/vendor/select2/select2.min.js\"></script>\r\n\t<!--===============================================================================================-->\r\n\t<script src=\"resources/vendor/daterangepicker/moment.min.js\"></script>\r\n\t<script src=\"resources/vendor/daterangepicker/daterangepicker.js\"></script>\r\n\t<!--===============================================================================================-->\r\n");
      out.write("\t<script src=\"resources/vendor/countdowntime/countdowntime.js\"></script>\r\n\t<!--===============================================================================================-->\r\n\t<script src=\"resources/js/main.js\"></script>\r\n\t<!--===============================================================================================-->\r\n\t<script src=\"resources/js/angular.min.js\"></script>\r\n\t<!-- <script\r\n\t\tsrc=\"http://ajax.googleapis.com/ajax/libs/angularjs/1.7.6/angular.min.js\"></script> -->\r\n</body>\r\n</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_form_005fform_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  form:form
    org.springframework.web.servlet.tags.form.FormTag _jspx_th_form_005fform_005f0 = (org.springframework.web.servlet.tags.form.FormTag) _005fjspx_005ftagPool_005fform_005fform_0026_005fstyle_005fname_005fmodelAttribute_005fmethod_005fclass_005faction.get(org.springframework.web.servlet.tags.form.FormTag.class);
    boolean _jspx_th_form_005fform_005f0_reused = false;
    try {
      _jspx_th_form_005fform_005f0.setPageContext(_jspx_page_context);
      _jspx_th_form_005fform_005f0.setParent(null);
      // /WEB-INF/jsp/login.jsp(154,4) name = name type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_form_005fform_005f0.setName("loginForm");
      // /WEB-INF/jsp/login.jsp(154,4) null
      _jspx_th_form_005fform_005f0.setDynamicAttribute(null, "style", "border-style: solid;  border-color: white;");
      // /WEB-INF/jsp/login.jsp(154,4) name = modelAttribute type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_form_005fform_005f0.setModelAttribute("login");
      // /WEB-INF/jsp/login.jsp(154,4) name = action type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_form_005fform_005f0.setAction("login.htm");
      // /WEB-INF/jsp/login.jsp(154,4) name = method type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_form_005fform_005f0.setMethod("post");
      // /WEB-INF/jsp/login.jsp(154,4) null
      _jspx_th_form_005fform_005f0.setDynamicAttribute(null, "class", "login100-form validate-form p-b-33 p-t-5 css-form");
      int[] _jspx_push_body_count_form_005fform_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_form_005fform_005f0 = _jspx_th_form_005fform_005f0.doStartTag();
        if (_jspx_eval_form_005fform_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n\t\t\t\t\t<img src=\"resources/images/frog1.png\"\r\n\t\t\t\t\t\tstyle=\"margin-top: -5px; border-radius: 9px;\">\r\n\r\n\t\t\t\t\t<div>\r\n\t\t\t\t\t\t<p style=\"color: red; font-size: 100%; text-align: left;\">\r\n\t\t\t\t\t\t\t");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${error}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write(" <i aria-hidden=\"true\"></i>\r\n\t\t\t\t\t\t</p>\r\n\t\t\t\t\t</div>\r\n\r\n\t\t\t\t\t");
            out.write("\r\n\t\t\t\t\t<div>\r\n\t\t\t\t\t\t<div style=\"color: #000000; text-align: center;\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${confirmMessage}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</div>\r\n\t\t\t\t\t</div>\r\n\r\n\t\t\t\t\t");
            if (_jspx_meth_c_005fif_005f0(_jspx_th_form_005fform_005f0, _jspx_page_context, _jspx_push_body_count_form_005fform_005f0))
              return true;
            out.write("\r\n\t\t\t\t\t<br>\r\n\r\n\t\t\t\t\t<div class=\"input-group\">\r\n\t\t\t\t\t\t<a style=\"border-bottom: 1.5px solid #04586d;\"><img\r\n\t\t\t\t\t\t\tsrc=\"resources/images/Login-Icon.png\" height=\"25px\" width=\"25px\"></a>\r\n\t\t\t\t\t\t<input type=\"text\" placeholder=\"username\" class=\"form-control\"\r\n\t\t\t\t\t\t\tname=\"username\" data-ng-model=\"username\"\r\n\t\t\t\t\t\t\tdata-ng-pattern=\"/^[a-zA-Z@.]{1,60}$/\" data-ng-required=\"true\" />\r\n\t\t\t\t\t\t<span class=\"form-control-feedback\" aria-hidden=\"true\"></span>\r\n\t\t\t\t\t</div>\r\n\r\n\t\t\t\t\t<div class=\"input-group\">\r\n\t\t\t\t\t<div data-ng-show=\"loginForm.username.$touched\">\r\n\t\t\t\t\t\t<div style=\"color: red\"\r\n\t\t\t\t\t\t\tdata-ng-show=\"loginForm.username.$error.required\">Please\r\n\t\t\t\t\t\t\tenter a valid username.</div>\r\n\t\t\t\t\t</div></div>\r\n\r\n\t\t\t\t\t<!-- <div>\r\n\t\t\t\t<p data-ng-bind=\"username\"></p>\r\n\t\t\t\t<p>{{username}}</p>\r\n\t\t\t\t\r\n\t\t\t</div> -->\r\n\r\n\t\t\t\t\t<br>\r\n\r\n\r\n\t\t\t\t\t<div class=\"input-group\">\r\n\t\t\t\t\t\t<a style=\"border-bottom: 1.5px solid #04586d;\"> <img\r\n\t\t\t\t\t\t\tsrc=\"resources/images/Password-Icon.png\" height=\"25px\"\r\n\t\t\t\t\t\t\twidth=\"25px\">\r\n\t\t\t\t\t\t</a> <input type=\"password\" placeholder=\"************\"\r\n");
            out.write("\t\t\t\t\t\t\tclass=\"form-control\" name=\"password\" data-ng-minlength=8\r\n\t\t\t\t\t\t\tdata-ng-model=\"password\" data-ng-required=\"true\" /> <span\r\n\t\t\t\t\t\t\tclass=\"form-control-feedback\" aria-hidden=\"true\"></span>\r\n\r\n\t\t\t\t\t</div>\r\n\r\n\t\t\t\t\t<div class=\"input-group\">\r\n\t\t\t\t\t<div\r\n\t\t\t\t\t\tdata-ng-show=\"loginForm.$submitted || loginForm.password.$touched\">\r\n\t\t\t\t\t\t<span style=\"color: red\"\r\n\t\t\t\t\t\t\tdata-ng-show=\"loginForm.password.$error.required\">Please\r\n\t\t\t\t\t\t\tenter your password.</span>\r\n\t\t\t\t\t</div></div>\r\n\t\t\t\t\t<br>\r\n\r\n\r\n\t\t\t\t\t<div class=\"container-login100-form-btn\">\r\n\t\t\t\t\t\t<div class=\"wrap-login100-form-btn\">\r\n\t\t\t\t\t\t\t<div class=\"login100-form-bgbtn\"></div>\r\n\t\t\t\t\t\t\t<button class=\"login100-form-btn btn1\" style=\"color: #fff;\">Login</button>\r\n\t\t\t\t\t\t</div>\r\n\t\t\t\t\t</div>\r\n\r\n\r\n\t\t\t\t\t<!-- <div class=\"input-group1\">\r\n\t\t\t\t\t\t<button type=\"submit\"\r\n\t\t\t\t\t\t\tclass=\"btn btn-lg btn-sucess btn-block disabled\"\r\n\t\t\t\t\t\t\tstyle=\"color: #fff;\" name=\"login\">Login</button>\r\n\t\t\t\t\t</div> -->\r\n\r\n\t\t\t\t\t<div>\r\n\t\t\t\t\t\t<span class=\"container\"> <a href=\"#\" data-backdrop=\"static\"\r\n");
            out.write("\t\t\t\t\t\t\tdata-keyboard=\"false\" data-target=\"#pwdModal\"\r\n\t\t\t\t\t\t\tstyle=\"color: #04586d; text-decoration: underline\"\r\n\t\t\t\t\t\t\tdata-toggle=\"modal\"><strong>Forgot password?</strong></a>\r\n\r\n\t\t\t\t\t\t</span>\r\n\t\t\t\t\t</div>\r\n\r\n\t\t\t\t");
            int evalDoAfterBody = _jspx_th_form_005fform_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_form_005fform_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_form_005fform_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_form_005fform_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_form_005fform_005f0.doFinally();
      }
      _005fjspx_005ftagPool_005fform_005fform_0026_005fstyle_005fname_005fmodelAttribute_005fmethod_005fclass_005faction.reuse(_jspx_th_form_005fform_005f0);
      _jspx_th_form_005fform_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_form_005fform_005f0, _jsp_getInstanceManager(), _jspx_th_form_005fform_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_form_005fform_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_form_005fform_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_form_005fform_005f0);
      // /WEB-INF/jsp/login.jsp(176,5) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.logout != null}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n\t\t\t\t\t\t<div class=\"alert \">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${msg}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</div>\r\n\t\t\t\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_form_005fform_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  form:form
    org.springframework.web.servlet.tags.form.FormTag _jspx_th_form_005fform_005f1 = (org.springframework.web.servlet.tags.form.FormTag) _005fjspx_005ftagPool_005fform_005fform_0026_005fmethod_005fid_005faction.get(org.springframework.web.servlet.tags.form.FormTag.class);
    boolean _jspx_th_form_005fform_005f1_reused = false;
    try {
      _jspx_th_form_005fform_005f1.setPageContext(_jspx_page_context);
      _jspx_th_form_005fform_005f1.setParent(null);
      // /WEB-INF/jsp/login.jsp(278,10) name = action type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_form_005fform_005f1.setAction("forgot.htm");
      // /WEB-INF/jsp/login.jsp(278,10) name = id type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_form_005fform_005f1.setId("forgot");
      // /WEB-INF/jsp/login.jsp(278,10) name = method type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_form_005fform_005f1.setMethod("post");
      int[] _jspx_push_body_count_form_005fform_005f1 = new int[] { 0 };
      try {
        int _jspx_eval_form_005fform_005f1 = _jspx_th_form_005fform_005f1.doStartTag();
        if (_jspx_eval_form_005fform_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t<div>\r\n\t\t\t\t\t\t\t\t\t\t\t\t<a class=\"form-feedback\"\r\n\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color: #10A2E1; font-size: 14px\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${confirmMessage}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write(" <i aria-hidden=\"true\"></i>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</a>\r\n\t\t\t\t\t\t\t\t\t\t\t</div>\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t<div class=\"form-group input-group has-feedback\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t<a style=\"border-bottom: 1.5px solid #04586d;\"><img\r\n\t\t\t\t\t\t\t\t\t\t\t\t\tsrc=\"resources/images/Login-Icon.png\" height=\"25px\"\r\n\t\t\t\t\t\t\t\t\t\t\t\t\twidth=\"25px\"></a> <input type=\"text\"\r\n\t\t\t\t\t\t\t\t\t\t\t\t\tplaceholder=\"User Name\" class=\"form-control\"\r\n\t\t\t\t\t\t\t\t\t\t\t\t\tname=\"username\" required=\"required\" /> <span\r\n\t\t\t\t\t\t\t\t\t\t\t\t\tclass=\"glyphicon form-control-feedback\" aria-hidden=\"true\"></span>\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t</div>\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t<!-- <div class=\"form-group input-group has-feedback\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"input-group-addon\"> <span\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tclass=\"fa fa-envelope\"></span>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</span> <input type=\"Email\" placeholder=\"Email Address\"\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tclass=\"form-control\" name=\"email\" id=\"email\"\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\trequired=\"required\" /> <span\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tclass=\"glyphicon form-control-feedback\"\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\taria-hidden=\"true\"></span>\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t</div> -->\r\n\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-primary btn-lg\"\r\n");
            out.write("\t\t\t\t\t\t\t\t\t\t\t\tonclick=\"spinner();\">Send</button>\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t<button type=\"reset\" class=\"btn btn-danger btn-lg\">Reset</button>\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t<div class=\"modal fade\" tabindex=\"-1\" role=\"dialog\"\r\n\t\t\t\t\t\t\t\t\t\t\t\tid=\"spinnerModal\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"modal-dialog modal-dialog-centered text-center\"\r\n\t\t\t\t\t\t\t\t\t\t\t\t\trole=\"document\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"fa fa-spinner fa-pulse fa-3x w-100\"></span>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t\t\t\t\t");
            int evalDoAfterBody = _jspx_th_form_005fform_005f1.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_form_005fform_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_form_005fform_005f1[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_form_005fform_005f1.doCatch(_jspx_exception);
      } finally {
        _jspx_th_form_005fform_005f1.doFinally();
      }
      _005fjspx_005ftagPool_005fform_005fform_0026_005fmethod_005fid_005faction.reuse(_jspx_th_form_005fform_005f1);
      _jspx_th_form_005fform_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_form_005fform_005f1, _jsp_getInstanceManager(), _jspx_th_form_005fform_005f1_reused);
    }
    return false;
  }
}
