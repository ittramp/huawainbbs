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
<div class="nav">
    <div class="wrapper">
        <a aria-label="${symphonyLabel}" href="${servePath}" class="tooltipped tooltipped-s nav__logo">
            <#--logo图片-->
            <img src="${servePath}/assets/themes/huayun/images/layout/logo.png"/>
        </a>

        <ul class="nav-tabs">
            <#--首页-->
            <#--<li class="nav-item">-->
                <#--<a class="nav-item__title" pjax-title="${latestLabel} - ${symphonyLabel}"-->
                   <#--href="${servePath}">-->
                    <#--${indexLabel}-->
                <#--</a>-->
            <#--</li>-->
            <#--用户自定义的版块(即domain)-->
            <li class="nav-item all_domains">
                <span class="nav-item__title">
                    全部版块
                </span>
                <#--子菜单-->
                <div class="all_domains__wrapper">
                    <#list domains as domain>
                    <#--单个domain及下属的-->
                        <ul class="domain_item">
                            <li class="domain_item__title">
                                <a pjax-title="${domain.domainTitle} - ${domainLabel} - ${symphonyLabel}"
                                   href="${servePath}/domain/${domain.domainURI}">${domain.domainIconPath} ${domain.domainTitle}</a>
                            </li>

                            <#list domain.domainTags as tag>
                                <li>
                                    <a href="${servePath}/domain/${domain.domainTitle}/tag/${tag.tagTitle}">
                                        ${tag.tagTitle}
                                    </a>
                                </li>
                            </#list>
                        </ul>
                    </#list>
                </div>
            </li>
            <#--<#list domains as domain>-->
            <#--<a pjax-title="${domain.domainTitle} - ${domainLabel} - ${symphonyLabel}"-->
            <#--href="${servePath}/domain/${domain.domainURI}"<#if selected?? && selected == domain.domainURI>-->
            <#--class="current"</#if>>${domain.domainIconPath} ${domain.domainTitle}</a>-->
            <#--</#list>-->
            <#--问答-->
            <#--<a pjax-title="${qnaLabel} - ${symphonyLabel}"-->
            <#--href="${servePath}/qna"<#if selected?? && 'qna' == selected> class="current"</#if>>-->
            <#--<svg>-->
            <#--<use xlink:href="#iconAsk"></use>-->
            <#--</svg> ${qnaLabel}</a>-->
            <#--如果已经登录，且用户设置了城市，则显示我的城市(同城交友??)-->
            <#--<#if isLoggedIn && "" != currentUser.userCity>-->
            <#--<a href="${servePath}/city/my"<#if selected?? && 'city' == selected> class="current"</#if>>-->
            <#--<svg>-->
            <#--<use xlink:href="#local"></use>-->
            <#--</svg> ${currentUser.userCity}</a>-->
            <#--</#if>-->
            <#--如果已经登录，则显示'关注者'(即谁关注了你),菜单-->
            <#--<#if isLoggedIn>-->
            <#--<a href="${servePath}/watch"<#if selected?? && 'watch' == selected> class="current"</#if>>-->
            <#--<svg>-->
            <#--<use xlink:href="#view"></use>-->
            <#--</svg> ${followLabel}</a>-->
            <#--</#if>-->
        </ul>
        <#--是否启用搜索栏 -->
        <#if esEnabled || algoliaEnabled>
            <form class="responsive-hide fn-left" target="_blank" action="/search">
                <input class="search" placeholder="搜索" type="text" name="key" id="search"
                       value="<#if key??>${key}</#if>">
                <input type="submit" class="fn-none" value=""/>
            </form>
        </#if>
        <#--用户信息导航-->
        <div class="user-nav">
            <#--根据用户是否登录来显示对应的菜单项-->
            <#if isLoggedIn>
            <#--发贴-->
                <a href="${servePath}/pre-post" class="nav_item tooltipped tooltipped-w"
                   aria-label="${postArticleLabel}">
                    ${postArticleLabel}
                </a>
            <#--如果有权限'menuAdmin'则显示'管理菜单'-->
                <#if permissions["menuAdmin"].permissionGrant>
                    <a href="${servePath}/admin" aria-label="${adminLabel}" class="nav_item tooltipped tooltipped-w">
                        ${adminLabel}
                    </a>
                </#if>
            <#--内部消息-->
                <a id="aNotifications"
                   class="tooltipped tooltipped-w nav_item user_msg <#if unreadNotificationCount == 0>no-msg<#else>msg</#if>"
                   href="${servePath}/notifications" aria-label="${messageLabel}" data-msg-count="${unreadNotificationCount}" >
                    <span class="icon">
                    </span>
                </a>
            <#--所有的活动(或者说是:'应用')-->
            <#--<a href="${servePath}/activities" aria-label="${activityLabel}" class="tooltipped tooltipped-w">-->
            <#--<svg>-->
            <#--<use xlink:href="#flag"></use>-->
            <#--</svg>-->
            <#--</a>-->
            <#--用户个人信息等菜单-->
                <a href="javascript:void(0)" id="aPersonListPanel" class="nav_item tooltipped tooltipped-w"
                   aria-label="${viewHomeAndProfileLabel}"
                   data-url="${servePath}/member/${currentUser.userName}">
                    <span class="avatar-small" style="background-image:url('${currentUser.userAvatarURL48}')"></span>
                </a>
                <div class="module person-list" id="personListPanel">
                    <ul>
                        <#--个人信息-->
                        <li>
                            <a href="${servePath}/member/${currentUser.userName}">${goHomeLabel}</a>
                        </li>
                        <#--设置-->
                        <li>
                            <a href="${servePath}/settings">${settingsLabel}</a>
                        </li>
                        <#--帮助-->
                        <li>
                            <a href="${servePath}/settings/help">${helpLabel}</a>
                        </li>
                        <#--拿出-->
                        <li>
                            <a href="javascript:Util.logout()">${logoutLabel}</a>
                        </li>
                    </ul>
                </div>
            <#else>
            <#--未登录时显示的按钮-->
                <a href="javascript:Util.goLogin();" class="nav_item unlogin">${loginLabel}</a>
                <a href="javascript:Util.goRegister()" class="nav_item unlogin">${registerLabel}</a>
            </#if>
        </div>
    </div>
</div>
