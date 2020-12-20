@extends('admin_layout')
@section('admin_content')
<div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Cập nhật sản phẩm
                        </header>
                        <div class="panel-body">
                        <?php
                            $message = Session::get('message');
                            if($message){
                                echo '<span class="text-alert">'.$message.'</span>';
                                Session::put('message', null);
                            }
                        ?>
                        @foreach($edit_product as $key => $pro)
                            <div class="position-center">
                                <form role="form" action="{{URL::to('/update-product/'.$pro->id)}}" method="post" enctype="multipart/form-data">
                                    {{csrf_field() }}
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Tên sản phẩm</label>
                                    <input type="text" name="name" class="form-control" id="exampleInputEmail1" value="{{$pro->name}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Mã số sản phẩm</label>
                                    <input type="text" name="code_product" class="form-control" id="exampleInputEmail1" value="{{$pro->code_product}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Hình ảnh sản phẩm</label>
                                    <input type="file" name="image" class="form-control" id="exampleInputEmail1">
                                    <img src="upload/product/{{$pro->image}}" height="100" width="100"></td>
                                </div>
                                <div class="form-group">
                                <label for="exampleInputPassword1">Giới tính</label>
                                    <select name="gender" class="form-control input-sm m-bot15">
                                            @if($pro->gender == "Nam")
                                                <option selected value="Nam">Nam</option>
                                            else
                                                <option value="Nữ">Nữ</option>
                                            @endif
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Loại kính</label>
                                    <input type="text" name="glass_type"class="form-control" id="exampleInputPassword1" value="{{$pro->glass_type}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Loại máy</label>
                                    <input type="text" name="system"class="form-control" id="exampleInputPassword1" value="{{$pro->system}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Đường kính mặt số</label>
                                    <input type="text" name="the_dial_diameter"class="form-control" id="exampleInputPassword1" value="{{$pro->the_dial_diameter}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Bề dày mặt số</label>
                                    <input type="text" name="number_surface_thickness"class="form-control" id="exampleInputPassword1" value="{{$pro->number_surface_thickness}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Loại dây đeo</label>
                                    <input type="text" name="strap"class="form-control" id="exampleInputPassword1" value="{{$pro->strap}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Màu mặt số</label>
                                    <input type="text" name="dial_color"class="form-control" id="exampleInputPassword1"value="{{$pro->dial_color}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Chức năng</label>
                                    <input type="text" name="function"class="form-control" id="exampleInputPassword1"value="{{$pro->function}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Giới thiệu</label>
                                    <input type="text" name="description"class="form-control" id="exampleInputPassword1"value="{{$pro->description}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Giá bán lẻ</label>
                                    <input type="text" name="unit_price"class="form-control" id="exampleInputPassword1"value="{{$pro->unit_price}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Giá khuyến mãi</label>
                                    <input type="text" name="promotion_price"class="form-control" id="exampleInputPassword1"value="{{$pro->promotion_price}}">
                                </div>
                                <div class="form-group">
                                <label for="exampleInputPassword1">Thương hiệu sản phẩm</label>
                                    <select name="brand" class="form-control input-sm m-bot15">
                                        @foreach($brand_product as $key => $brand)
                                            @if($brand->type_id == $pro->id_type)
                                            <option selected value="{{$brand->type_id}}">{{$brand->type_name}}</option>
                                            @else
                                            <option value="{{$brand->type_id}}">{{$brand->type_name}}</option>
                                            @endif
                                        @endforeach
                                        
                                    </select>
                                </div>
                                <div class="form-group">
                                <label for="exampleInputPassword1">Hiển thị</label>
                                    <select name="status" class="form-control input-sm m-bot15">
                                        @if($pro->status == 0)
                                        <option selected value="0">Hiển thị</option>
                                        @else
                                        <option value="1">Ẩn</option>
                                        @endif
                                    </select>
                                </div>
                                
                                <button type="submit" name="update_product" class="btn btn-info">Cập nhật sản phẩm</button>
                            </form>
                            
                            </div>
                            @endforeach
                        </div>
                    </section>

            </div>
@endsection