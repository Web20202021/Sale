@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
<div class="panel panel-default">
    <div class="panel-heading">
      Danh mục sản phẩm
    </div>
    <div class="table-responsive">
        <?php
            $message = Session::get('message');
            if($message){
                echo '<span class="text-alert">'.$message.'</span>';
                Session::put('message', null);
            }
        ?>
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Tên danh mục</th>
            <th>Hiển thị</th>
            
            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
            @foreach($all_category_product as $key => $cate_pro)
          <tr>
            
            <td>{{$cate_pro->type_name}}</td>
            <td><span class="text-ellipsis">
            <?php
                if($cate_pro->type_status == 0){
            ?>
                <a href="{{URL::to('/unactive-category-product/'.$cate_pro->type_id)}}"><span class="fa-thumb-style fa fa-lightbulb-o"></span></a>
            <?php
            }else{?>
                <a href="{{URL::to('/active-category-product/'.$cate_pro->type_id)}}"><span class="fa-thumb-styling fa fa-lightbulb-o"></span></a>
            <?php
            }
            ?>
            </span></td>
            <td>
              <a href="{{URL::to('/edit-category-product/'.$cate_pro->type_id)}}" class="active styling-edit" ui-toggle-class="">
              <i class="fa fa-pencil-square-o text-success text-active"></i></a>
              <a onClick="return confirm('Bạn có chắc muốn xóa danh mục này không?')" href="{{URL::to('/delete-category-product/'.$cate_pro->type_id)}}" class="active styling-delete" ui-toggle-class="">
              <i class="fa fa-times text-danger text"></i>
              </a>
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
  </div>
</div>
@endsection