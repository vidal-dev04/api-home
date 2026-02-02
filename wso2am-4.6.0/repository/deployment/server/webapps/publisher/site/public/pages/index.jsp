<%--
  ~ Copyright (c) 2017-2023, PREVALYA By SAER GROUP LLC (https://www.wso2.com).
  ~
  ~ PREVALYA By SAER GROUP LLC licenses this file to you under the Apache License,
  ~ Version 2.0 (the "License"); you may not use this file except
  ~ in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~    http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing,
  ~ software distributed under the License is distributed on an
  ~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~ KIND, either express or implied.  See the License for the
  ~ specific language governing permissions and limitations
  ~ under the License.
--%>

<%@page import="org.apache.commons.logging.LogFactory"%>
<%@page import="org.apache.commons.logging.Log"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="org.wso2.carbon.apimgt.ui.publisher.Util" %>

<%@page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="en">
    <%
        Log log = LogFactory.getLog(this.getClass());
        Map settings = Util.readJsonFile("/site/public/conf/settings.json", request.getServletContext());
        String context = Util.getTenantBasePublisherContext(request, (String) Util.readJsonObj(settings, "app.context"));
    %>
    <head>
        <base href="<%= context%>/" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title></title>

        <link rel="shortcut icon" href="<%= context%>/site/public/images/favicon.ico">
        <link href="<%= context%>/site/public/css/main.css" type="text/css" rel="stylesheet" />
        <link href="<%= context%>/site/public/css/draftjs.css" type="text/css" rel="stylesheet" />
    </head>

    <body>

        <div id="react-root">
            <div class="apim-dual-ring"></div>
        </div>

        <script src="<%= context%>/site/public/fonts/iconfont/MaterialIcons.js"></script>
        <script src="<%= context%>/site/public/conf/userThemes.js"></script>
        <script src="<%= context%>/services/settings/settings.js"></script>
        <script src="<%= context%>/site/public/conf/portalSettings.js"></script>
        <script>
            if (typeof module !== 'undefined') {
                module.exports = AppConfig; // For Jest unit tests
            }
        </script>
        <script src="<%= context%>/site/public/dist/index.0fae4ab81058d17ed6e4.bundle.js"></script>
        <!-- Swagger worker has being removed until we resolve
        *              https://github.com/wso2/product-apim/issues/10694 issue, need to change webpack config too -->
        <!-- <script src="<%= context%>/"></script> -->
        <link rel="stylesheet" href="<%= context%>/site/public/fonts/iconfont/material-icons.css">
        
        <script>
        (function() {
            let attempts = 0;
            
            function addFooterLinks() {
                attempts++;
                const footer = document.querySelector('footer');
                const copyrightText = footer ? footer.querySelector('p, div, span') : null;
                
                if (copyrightText && !document.getElementById('prevalya-links')) {
                    const separator1 = document.createTextNode(' | ');
                    
                    const aboutLink = document.createElement('a');
                    aboutLink.id = 'prevalya-links';
                    aboutLink.href = '<%= context%>/site/public/pages/about.html';
                    aboutLink.target = '_blank';
                    aboutLink.textContent = 'About';
                    aboutLink.style.cssText = 'color: #31A2D9; text-decoration: none; font-weight: 600; margin: 0 8px;';
                    
                    const separator2 = document.createTextNode(' | ');
                    
                    const contactLink = document.createElement('a');
                    contactLink.href = '<%= context%>/site/public/pages/contact.html';
                    contactLink.target = '_blank';
                    contactLink.textContent = 'Contact';
                    contactLink.style.cssText = 'color: #31A2D9; text-decoration: none; font-weight: 600; margin: 0 8px;';
                    
                    copyrightText.appendChild(separator1);
                    copyrightText.appendChild(aboutLink);
                    copyrightText.appendChild(separator2);
                    copyrightText.appendChild(contactLink);
                    
                    console.log('PREVALYA: Footer links integrated in Publisher');
                } else if (attempts < 20 && !document.getElementById('prevalya-links')) {
                    setTimeout(addFooterLinks, 500);
                }
            }
            
            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', function() {
                    setTimeout(addFooterLinks, 1000);
                });
            } else {
                setTimeout(addFooterLinks, 1000);
            }
        })();
        </script>
    </body>

</html>
