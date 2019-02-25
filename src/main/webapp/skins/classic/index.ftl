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
    <div class="wrapper bg-white">
        <#--贴子显示区域-->
        <div class="index-main tabs">
            <div class="fn-clear article-selector tabs-header">
                <span class="tabs-header-item selected">全部</span>
                <span class="tabs-header-item">精华帖</span>
                <span class="query-tools">
                    <select>
                    <option value="最新发布">最新发布</option>
                    <option value="最新更新">最新更新</option>
                    <option value="查看数">查看数</option>
                    <option value="回帖数">回帖数</option>
                </select>
                    <select>
                    <option value="0">全部时间</option>
                    <option value="today">今天</option>
                    <option value="3day">三天</option>
                    <option value="1weak">一周</option>
                    <option value="1month">一月</option>
                    <option value="3month">三月</option>
                    <option value="6month">半年</option>
                </select>
                </span>
            </div>

            <div class="tabs-panels">
                <#-- ############# 最新贴子列表 ############## -->
                <ul class="article-list">
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
                <#-- ############# 精华贴子列表 ############## -->
                <ul class="article-list">
                    <#list perfectArticles as article>
                    <#--单个贴子项-->
                        <#include "common/list-item.ftl">
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
