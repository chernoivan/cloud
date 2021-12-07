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
                                <input type="hidden" name="fileName" class="form-control"
                                       value="${message.fileName!""}">
                                <button type="submit" class="btn btn-primary">Download</button>
                            </form>
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#exampleModal">
                                Launch demo modal
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <!--text-->
                                        <div class="modal-body">
                                            <div class="input-group">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">
                                                    <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
                                                </div>
                                            </div>

                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">Зчитати</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
            <#else>
                <h3>No files</h3>
            </#list>
        </form>
    </div>
</@c.page>