<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group">
            <label for="InputLogin">User Name</label>
            <input type="text" name="username" class="form-control col-sm-6" placeholder="Enter login/">
        </div>
        <div class="form-group">
            <label for="InputPassword">Password</label>
            <input type="password" name="password" class="form-control col-sm-6" placeholder="Password"/>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary"><#if isRegisterForm>Registration<#else>Sing In</#if></button>
        <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Sing Out</button>
    </form>
</#macro>