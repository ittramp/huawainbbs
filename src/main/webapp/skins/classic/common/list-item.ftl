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
<#include "title-icon.ftl">
<li class="article-item fn-flex">
    <#--帖子作者的头像-->
    <div class="left">
        <#if article.articleAnonymous == 0>
        <a rel="nofollow" href="${servePath}/member/${article.articleAuthorName}"></#if>
            <div class="avatar" style="background-image:url('${article.articleAuthorThumbnailURL48}')"></div>
            <#if article.articleAnonymous == 0>
        </a>
        </#if>
    </div>
    <#--中间帖子的信息展示区域-->
    <ul class="center">
        <li>
            <#--帖子所属的tags-->
            [
            <#list article.articleTagObjs as articleTag>
                <a rel="tag" href="${servePath}/tag/${articleTag.tagURI}">${articleTag.tagTitle}</a>
                <#sep>,
            </#list>
            ]
            <#--帖子的标题-->
            <a class="ft-a-title" data-id="${article.oId}" data-type="${article.articleType}" rel="bookmark"
               href="${servePath}${article.articlePermalink}">${article.articleTitleEmoj}
            </a>
            <#--帖子的类型图标,即:'精华帖','置顶帖'等-->
            <span class="article-icons">
                <@icon article.articlePerfect article.articleType article.articleStick></@icon>
            </span>
        </li>
        <li>
            <#--作者的名称-->
            <#if article.articleAnonymous == 0>
            <span class="info-item author-name">发布者:
            <a rel="nofollow" class="author"
               href="${servePath}/member/${article.articleAuthorName}"></#if>
                ${article.articleAuthorName}
                <#if article.articleAnonymous == 0></a></span></#if>
            <#--发帖时间-->
            <span class="info-item">
                发布时间: TODO!
            </span>
            <span class="info-item last_comment">
                <#--最后一个回帖的信息-->
                <#if "" != article.articleLatestCmterName>
                    <#if article.articleLatestCmterName != 'someone'>
                        <a rel="nofollow" class="author" href="${servePath}/member/${article.articleLatestCmterName}"></#if>
                    <span class="author">${article.articleLatestCmterName}</span><#if article.articleLatestCmterName != 'someone'></a>
                </#if>
                    在 ${article.cmtTimeAgo}${cmtLabel}
                </#if>
            </span>
        </li>
    </ul>
    <ul class="right">
        <li>
            <#--查看数量-->
            <a class="ft-fade" href="${servePath}${article.articlePermalink}">
                <i class="icon icon-view"></i> ${viewLabel}:${article.articleViewCntDisplayFormat!0}
            </a>
        </li>
        <li>
            <#--回复数量-->
            <a class="ft-fade" href="${servePath}${article.articlePermalink}#comments">
                <i class="icon icon-comment"></i> ${cmtLabel}:${article.articleCommentCount!0}
            </a>
        </li>
    </ul>
</li>