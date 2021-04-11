<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    ADD NEW USER

    ${message!""}
    <@l.login "/registration" />
</@c.page>