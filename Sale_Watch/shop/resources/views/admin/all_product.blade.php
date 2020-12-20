@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
<div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê sản phẩm
    </div>
    <div class="row w3-res-tb">
      <div class="col-sm-5 m-b-xs">
        <select class="input-sm form-control w-sm inline v-middle">
          <option value="0">Bulk action</option>
          <option value="1">Delete selected</option>
          <option value="2">Bulk edit</option>
          <option value="3">Export</option>
        </select>
        <button class="btn btn-sm btn-default">Apply</button>                
      </div>
      <div class="col-sm-4">
      </div>
      <div class="col-sm-3">
        <div class="input-group">
          <input type="text" class="input-sm form-control" placeholder="Search">
          <span class="input-group-btn">
            <button class="btn btn-sm btn-default" type="button">Go!</button>
          </span>
        </div>
      </div>
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
            <th style="width:20px;">
              <label class="i-checks m-b-none">
                <input type="checkbox"><i></i>
              </label>
            </th>
            <th>Tên sản phẩm</th>
            <th>Hình ảnh</th>
            <th>Thương hiệu</th>
            <th>Mã số sản phẩm</th>
            <th>Giới tính</th>
            <th>Loại kính</th>
            <th>Loại máy</th>
            <th>Đường kính mặt số</th>
            <th>Bề dày mặt số</th>
            <th>Dây đeo</th>
            <th>Màu mặt số</th>
            <th>Chức năng</th>
            <th>Giới thiệu</th>
            <th>Giá bán lẻ</th>
            <th>Giá khuyến mãi</th>
            
            
            <th>Hiển thị</th>
            
            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
            @foreach($all_product as $key => $pro)
          <tr>
            <td><label class="i-checks m-b-none"><input type="checkbox" name="post[]"><i></i></label></td>
            <td>{{$pro->name}}</td>
            <td><img src="edit-product/upload/product/{{$pro->image}}" height="100" width="100"></td>
            <td>{{$pro->type_name}}</td>
            <td>{{$pro->code_product}}</td>
            <td>{{$pro->gender}}</td>
            <td>{{$pro->glass_type}}</td>
            <td>{{$pro->system}}</td>
            <td>{{$pro->the_dial_diameter}}</td>
            <td>{{$pro->number_surface_thickness}}</td>
            <td>{{$pro->strap}}</td>
            <td>{{$pro->dial_color}}</td>
            <td>{{$pro->function}}</td>
            <td>{{$pro->description}}</td>
            <td>{{$pro->unit_price}}</td>
            <td>{{$pro->promotion_price}}</td>
            <td><span class="text-ellipsis">
            <?php
                if($pro->status == 0){
            ?>
                <a href="{{URL::to('/unactive-product/'.$pro->id)}}"><span class="fa-thumb-style fa fa-lightbulb-o"></span></a>
            <?php
            }else{?>
                <a href="{{URL::to('/active-product/'.$pro->id)}}"><span class="fa-thumb-styling fa fa-lightbulb-o"></span></a>
            <?php
            }
            ?>
            </span></td>
            <td>
              <a href="{{URL::to('/edit-product/'.$pro->id)}}" class="active styling-edit" ui-toggle-class="">
              <i class="fa fa-pencil-square-o text-success text-active"></i></a>
              <a onClick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?')" href="{{URL::to('/delete-product/'.$pro->id)}}" class="active styling-delete" ui-toggle-class="">
              <i class="fa fa-times text-danger text"></i>
              </a>
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
    <footer class="panel-footer">
      <div class="row">
        
        <div class="col-sm-5 text-center">
          <small class="text-muted inline m-t-sm m-b-sm">showing 20-30 of 50 items</small>
        </div>
        <div class="col-sm-7 text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            <li><a href=""><i class="fa fa-chevron-left"></i></a></li>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
            <li><a href=""><i class="fa fa-chevron-right"></i></a></li>
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection