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
            <li class="nav-item">
                <a class="nav-item__title" pjax-title="${latestLabel} - ${symphonyLabel}"
                   href="${servePath}">
                    ${indexLabel}
                </a>
            </li>
            <#--用户自定义的版块(即domain)-->
            <li class="nav-item all_domains">
                <span class="nav-item__title">
                    全部版块
                </span>
                <#--子菜单-->
                <ul class="nav-item__chileren all_domains__wrapper">
                    <#list domains as domain>
                        <li class="nav-item">
                            <a class="nav-item__title"
                               pjax-title="${domain.domainTitle} - ${domainLabel} - ${symphonyLabel}"
                               href="${servePath}/domain/${domain.domainURI}"<#if selected?? && selected == domain.domainURI>
                                class="current"</#if>>${domain.domainIconPath} ${domain.domainTitle}</a>
                            <ul class="nav-item__chileren tags_wrapper">
                                <#list domain.domainTags as tag>
                                    <li>
                                        <a href="${servePath}/domain/${domain.domainTitle}/tag/${tag.tagTitle}">
                                            ${tag.tagTitle}
                                        </a>
                                    </li>
                                </#list>
                            </ul>
                        </li>
                    </#list>
                </ul>
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
                <input class="search" placeholder="Search HacPai" type="text" name="key" id="search"
                       value="<#if key??>${key}</#if>">
                <input type="submit" class="fn-none" value=""/>
            </form>
        </#if>
        <#--用户信息导航-->
        <div class="user-nav">
            <#--根据用户是否登录来显示对应的菜单项-->
            <#if isLoggedIn>
            <#--发贴-->
                <a href="${servePath}/pre-post" class="tooltipped tooltipped-w" aria-label="${postArticleLabel}">
                    <svg>
                        <use xlink:href="#addfile"></use>
                    </svg>
                </a>
            <#--如果有权限'menuAdmin'则显示'管理菜单'-->
                <#if permissions["menuAdmin"].permissionGrant>
                    <a href="${servePath}/admin" aria-label="${adminLabel}" class="tooltipped tooltipped-w">
                        <svg>
                            <use xlink:href="#userrole"></use>
                        </svg>
                    </a>
                </#if>
            <#--内部消息-->
                <a id="aNotifications"
                   class="tooltipped tooltipped-w <#if unreadNotificationCount == 0>no-msg<#else>msg</#if>"
                   href="${servePath}/notifications" aria-label="${messageLabel}">${unreadNotificationCount}</a>
            <#--所有的活动(或者说是:'应用')-->
            <#--<a href="${servePath}/activities" aria-label="${activityLabel}" class="tooltipped tooltipped-w">-->
            <#--<svg>-->
            <#--<use xlink:href="#flag"></use>-->
            <#--</svg>-->
            <#--</a>-->
            <#--用户个人信息等菜单-->
                <a href="javascript:void(0)" id="aPersonListPanel" class="tooltipped tooltipped-w"
                   aria-label="${viewHomeAndProfileLabel}"
                   data-url="${servePath}/member/${currentUser.userName}">
                    <span class="avatar-small" style="background-image:url('${currentUser.userAvatarURL20}')"></span>
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
                <a href="javascript: Util.goLogin();" class="unlogin">${loginLabel}</a>
                <a href="javascript:Util.goRegister()" class="unlogin">${registerLabel}</a>
            </#if>
        </div>
    </div>
</div>
