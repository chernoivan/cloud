<#import "parts/common.ftl" as c>
<@c.page>
    USER EDITOR

    <form action="/user" method="post">
        <div>User name
            <input type="text" name="username" value="${user.username}">
        </div>

        <#list roles as role>
            <div>
                <label>
                    <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                    ${role}
                </label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Apply changes</button>
    </form>
</@c.page>