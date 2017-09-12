<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>KOKEMOMO CMS ADMIN</title>
        <!-- Bootstrap -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js"></script>        
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/united/bootstrap.min.css" rel="stylesheet" integrity="sha384-pVJelSCJ58Og1XDc2E95RVYHZDPb9AVyXsI8NoVpB2xmtxoZKJePbMfE4mlXw7BJ" crossorigin="anonymous">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <section class="container">
            % task = result['task']
            <div class="col-sm-12">
                <h3>課題登録</h3>
                <div class="box">
                    <form id="form" action="/pm/task/save" method="post">
                        <input type="hidden" name="id" id="id" value="{{task.id}}">
                        <table class="table table-striped table-hover">
                        <tbody>
                            <tr class="row">
                                <th width="100px">カテゴリ<span class=""></span></th>
                                <td>
                                    <input type="text" name="category" id="category" value="{{task.category}}" size="50">
                                </td>
                            </tr>
                            <tr class="row">
                                <th width="100px">対象<span class=""></span></th>
                                <td>
                                    <input type="text" name="target" id="target" value="{{task.target}}" size="50">
                                </td>
                            </tr>
                            <tr class="row">
                                <th width="100px">内容</th>
                                <td>
                                    <input type="text" name="contents" id="contents" value="{{task.contents}}" size="50">
                                </td>
                            </tr>
                            <tr class="row">
                                <th width="100px">フェーズ<span class=""></span></th>
                                <td>
                                    <input type="text" name="faze" id="faze" value="{{task.faze}}" size="50">
                                </td>
                            </tr>
                            <tr class="row">
                                <th width="100px">備考<span class=""></span></th>
                                <td>
                                    <input type="text" name="remarks" id="remarks" value="{{task.remarks}}" size="50">
                                </td>
                            </tr>
                            <tr class="row">
                                <th width="100px">削除</th>
                                <td>
                                    <input type="checkbox" id="delete" name="delete" class="form-control">
                                </td>
                            </tr>
                        </tbody>
                        </table>
                        <button type="submit" class="btn btn-primary">保存</button>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>