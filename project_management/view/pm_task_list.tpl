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
            <h3>課題管理</h3>
            <div class="row">
                <div class="col-sm-12">
                    <form action="/pm/task" id="pm_task_search">
                        <input type="submit" value="検索" class="btn btn-default">
                    </form>
                    <table class="table table-striped table-hover ">
                        <thead>
                            <tr>
                            <th>ID</th>
                            <th>カテゴリ</th>
                            <th>対象</th>
                            <th>内容</th>
                            <th>フェーズ</th>
                            <th>備考</th>
                            <th>
                                <form action="/pm/task/edit" id="pm_task_edit">
                                    <input type="submit" value="追加" class="btn btn-default"/>
                                </form>
                            </th>
                            </tr>
                        </thead>
                        <tbody>
                            % for task in result['tasks']:
                            <tr>
                                <form action="/pm/task/edit" id="pm_task_edit">
                                <td><label id='pm_task_id_" + task.id + "'>{{task.id}}</label></td>
                                <td><label id='km_task_category_" + task.category + "'>{{task.category}}</label></td>
                                <td><label id='km_task_target_" + task.target + "'>{{task.target}}</label></td>
                                <td><label id='km_task_contents_" + task.contents + "'>{{task.contents}}</label></td>
                                <td><label id='km_task_faze_" + task.faze + "'>{{task.faze}}</label></td>
                                <td><label id='km_task_remarks_" + task.remarks + "'>{{task.remarks}}</label></td>
                                <td>
                                        <input type="hidden" value="{{task.id}}" name="pm_task_id" id="pm_task_id"/>
                                        <input type="submit" value="編集" class="btn btn-default"/>
                                </td>
                                </form>
                            </tr>
                            % end
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </body>
</html>