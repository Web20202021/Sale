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
                                    <input type="text" name="product_name" class="form-control" id="exampleInputEmail1" value="{{$pro->name}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Bộ sản phẩm gồm</label>
                                    <input type="text" name="product_description" class="form-control" id="exampleInputEmail1" value="{{$pro->description}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Hình ảnh sản phẩm</label>
                                    <input type="file" name="product_image" class="form-control" id="exampleInputEmail1">
                                    <img src="upload/product/{{$pro->image_product}}" height="100" width="100"></td>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Hệ điều hành</label>
                                    <input type="text" name="product_operating_system"class="form-control" id="exampleInputPassword1" value="{{$pro->operating_system}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Màn hình</label>
                                    <input type="text" name="product_monitor"class="form-control" id="exampleInputPassword1" value="{{$pro->monitor}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Tên GPU</label>
                                    <input type="text" name="product_gpu"class="form-control" id="exampleInputPassword1"value="{{$pro->gpu}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Dung lượng Ram</label>
                                    <input type="text" name="product_ram"class="form-control" id="exampleInputPassword1"value="{{$pro->ram}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Dung lượng Rom</label>
                                    <input type="text" name="product_rom"class="form-control" id="exampleInputPassword1"value="{{$pro->rom}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Camera trước</label>
                                    <input type="text" name="product_front_camera"class="form-control" id="exampleInputPassword1"value="{{$pro->front_camera}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Camera sau</label>
                                    <input type="text" name="product_rear_camera"class="form-control" id="exampleInputPassword1"value="{{$pro->rear_camera}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">CPU</label>
                                    <input type="text" name="product_cpu"class="form-control" id="exampleInputPassword1"value="{{$pro->cpu}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Dung lượng pin</label>
                                    <input type="text" name="product_battery"class="form-control" id="exampleInputPassword1"value="{{$pro->battery}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Thời gian bảo hành</label>
                                    <input type="text" name="product_warranty"class="form-control" id="exampleInputPassword1"value="{{$pro->warranty}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Giá bán lẻ</label>
                                    <input type="text" name="product_unit_price"class="form-control" id="exampleInputPassword1"value="{{$pro->unit_price}}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Giá khuyến mãi</label>
                                    <input type="text" name="product_promotion_price"class="form-control" id="exampleInputPassword1"value="{{$pro->promotion_price}}">
                                </div>
                                <div class="form-group">
                                <label for="exampleInputPassword1">Thương hiệu sản phẩm</label>
                                    <select name="product_brand" class="form-control input-sm m-bot15">
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
                                    <select name="product_status" class="form-control input-sm m-bot15">
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