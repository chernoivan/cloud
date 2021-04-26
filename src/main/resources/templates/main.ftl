<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-group">
        <form method="post" enctype="multipart/form-data" class="form-inline">
            <div class="form-group col-sm-4">
                <input type="text" class="form-control col-sm-12" name="text" placeholder="Введите примечание"/>
            </div>
            <div class="custom-file col-sm-4">
                <input type="file" name="file" class="custom-file-input" id="customFile">
                <label class="custom-file-label" for="customFile">Choose file</label>
            </div>
            <button type="submit" class="btn btn-primary ml-3">Добавить</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>
    </div>
    <div class="card-columns ml-3" style="column-count: 5;">
        <form action="@{lien}" method="get">
            <#list messages as message>
                <#if name=message.authorName>
                    <div class="card my-3">
                        <img class="card-img-top" src="static/FILE.png" alt="File image">
                        <div class="card-body">
                            <h5 class="card-title">${message.fileInitialName!""}</h5>
                            <p class="card-text"><span>${message.text}</span></p>
                            <form method="get" action="/download">
                                <input type="hidden" name="fileName" class="form-control" value="${message.fileName}">
                                <button type="submit" class="btn btn-primary">Download</button>
                            </form>
                        </div>
                    </div>
                </#if>
            <#else>
                <h3>No files</h3>
            </#list>
        </form>
    </div>
</@c.page>