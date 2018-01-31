package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<base href=\"");
      out.print(basePath);
      out.write("\"/>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/admin/common/css/style_login.jsp", out, false);
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(basePath);
      out.write("js/md5-min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(basePath);
      out.write("js/lib/jquery/jquery-1.7.1.min.js\"></script>\r\n");
      out.write("<title>平台</title>\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("  if( window.top != window.self ) window.top.locaton.href = \"");
      out.print(basePath );
      out.write("loginPage.action\";\r\n");
      out.write("//用户名密码输入框互动显示效果\r\n");
      out.write("\t$('#account').focus(function() {\r\n");
      out.write("\t\t$(this).removeClass('userBoxOver');\r\n");
      out.write("\t\t$(this).addClass('userBoxMove');\r\n");
      out.write("\t});\r\n");
      out.write("\t$('#account').blur(function() {\r\n");
      out.write("\t\tif ($(this).val()) {\r\n");
      out.write("\t\t\t$(this).removeClass('userBoxMove');\r\n");
      out.write("\t\t\t$(this).addClass('userBoxOver');\r\n");
      out.write("\t\t} else {\r\n");
      out.write("\t\t\t$(this).removeClass('userBoxMove');\r\n");
      out.write("\t\t\t$(this).addClass('userBox');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$('#password').focus(function() {\r\n");
      out.write("\t\t$(this).removeClass('passworkBoxOver');\r\n");
      out.write("\t\t$(this).addClass('passworkBoxMove');\r\n");
      out.write("\t});\r\n");
      out.write("\t$('#password').blur(function() {\r\n");
      out.write("\t\tif ($(this).val()) {\r\n");
      out.write("\t\t\t$(this).removeClass('passworkBoxMove');\r\n");
      out.write("\t\t\t$(this).addClass('passworkBoxOver');\r\n");
      out.write("\t\t} else {\r\n");
      out.write("\t\t\t$(this).removeClass('passworkBoxMove');\r\n");
      out.write("\t\t\t$(this).addClass('passworkBox');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t$('#password').focus();\r\n");
      out.write("\t$('#account').focus();\r\n");
      out.write("})\r\n");
      out.write("function login(){\r\n");
      out.write("\t$(\"#password\").val(hex_md5($('#password').val())); \r\n");
      out.write("\t$('#form').submit();\r\n");
      out.write("\treturn false;\r\n");
      out.write("}\r\n");
      out.write("function onkeydownEnter(e){\r\n");
      out.write("    if(!e) e=window.event;\r\n");
      out.write("   if((e.keyCode || e.which) ==13){\r\n");
      out.write("      login();  //转到验证的函数\r\n");
      out.write("   }\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("      <div class=\"\">   Runcolt Automotive Technology Back-House Management System  </div>\r\n");
      out.write("      <div>   广州润驹汽车科技有限公司行政管理系统  </div>\r\n");
      out.write("\t<div class=\"loginTopColor\"></div>\r\n");
      out.write("\t<div class=\"loginBg\">\r\n");
      out.write("\t\t<form action=\"");
      out.print(basePath );
      out.write("login.action\" id=\"form\" method=\"post\">\r\n");
      out.write("\t\t\t<div class=\"loginContent\">\r\n");
      out.write("\t    \t\t<input type=\"text\" class=\"userBox\" id=\"account\" name=\"user.username\" maxlength=\"50\" value=\"admin\"   onkeydown=\"onkeydownEnter();\" />\r\n");
      out.write("      \t\t\t<input type=\"password\" class=\"passworkBox\" id=\"password\" name=\"user.password\" maxlength=\"50\" value=\"admin\"  onkeydown=\"onkeydownEnter();\"/>\r\n");
      out.write("\t\t\t\t<a href=\"javascript:void(0);\" onclick=\"javascript:login();\" class=\"loginBtn\" title=\"点击登录系统\"></a>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<span id=\"message\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.remark}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("</span>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div>  若无法登录或忘记密码请与管理员联系  </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
