<#--

    Symphony - A modern community (forum/BBS/SNS/blog) platform written in Java.
    Copyright (C) 2012-2018, b3log.org & hacpai.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<#include "macro-head.ftl">
<#include "common/title-icon.ftl">
<!DOCTYPE html>
<html>
<head>
    <@head title="${symphonyLabel}">
        <meta name="description" content="${symDescriptionLabel}"/>
    </@head>
    <link rel="stylesheet" href="${staticServePath}/assets/themes/huayun/css/index.css?${staticResourceVersion}"/>
    <link rel="canonical" href="${servePath}">
</head>
<body class="index">
<#--头部Banner 没有什么鸟用，去掉-->
<#--${HeaderBannerLabel}-->
<#--头部功能条,包括logo,已登录用户信息菜单等-->
<#include "header.ftl">
<#--首页主要显示区域-->
<div class="main">
    <#--首页内容wrapper,用来设置最大宽度-->
    <div class="wrapper">
        <#--贴子显示区域-->
        <div class="index-main">
            <#-- ############# 最新贴子列表 ############## -->
            <div class="index-tabs-panels list article-list">
                <ul>
                    <#list recentArticles as article>
                    <#--单个贴子项-->
                        <#include "common/list-item.ftl">
                    </#list>
                    <#--最新贴子为空时的显示内容-->
                    <#if recentArticles?size == 0>
                        <li class="ft-center">
                            <br><br>
                            ${systemEmptyLabel}<br>
                            ${systemEmptyTipLabel}<br>
                            <img src="${staticServePath}/images/404/5.gif"/>
                        </li>
                    </#if>
                    <#--更多贴子按钮-->
                    <li>
                        <a class="more" href="${servePath}/recent">${moreRecentArticleLabel}</a>
                    </li>
                </ul>
            </div>
            <#-- ############# 精华贴子列表 ############## -->
            <div class="perfect-panel list">
                <ul>
                    <#list perfectArticles as article>
                        <li>
                            <a rel="nofollow" href="${servePath}/member/${article.articleAuthorName}">
                                <span class="avatar-small tooltipped tooltipped-se"
                                      aria-label="${article.articleAuthorName}"
                                      style="background-image:url('${article.articleAuthorThumbnailURL48}')"></span>
                            </a>
                            <a rel="nofollow" class="fn-ellipsis ft-a-title"
                               href="${servePath}${article.articlePermalink}">${article.articleTitleEmoj}</a>
                            <a class="fn-right count ft-gray ft-smaller"
                               href="${servePath}${article.articlePermalink}"><#if article.articleViewCount < 1000>
                                    ${article.articleViewCount}<#else>${article.articleViewCntDisplayFormat}</#if></a>
                        </li>
                    </#list>
                    <#if perfectArticles?size == 0>
                        <li>${chickenEggLabel}</li>
                    </#if>
                </ul>
            </div>
        </div>
        <#--侧边框-->
        <div class="index-side">

        </div>
    </div>
</div>
<#include "footer.ftl">
<script src="${staticServePath}/js/channel${miniPostfix}.js?${staticResourceVersion}"></script>
</body>
</html>
