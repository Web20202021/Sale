@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
<div class="panel panel-default">
    <div class="panel-heading">
      Chi tiết đơn hàng
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
            
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Tông tiền</th>
          </tr>
        </thead>
        <tbody>
        @foreach($order as $key => $ord)            
          <tr>
            <td>{{$ord->name}}</td>
            <td>{{$ord->quantity}}</td>
            <td>{{number_format($ord->unit_price)}} đồng</td>
            <td>{{number_format($ord->unit_price * $ord->quantity)}} đồng</td>
          </tr>
        @endforeach
        <tr>
            <th>Thành tiền</th>
          </tr>
          <tr>
            <td>{{number_format($order_by_id->total)}} đồng</th>
          </tr>
        </tbody>
      </table>
    </div>
    
  </div>
</div>
<br>
<div class="table-agile-info">
<div class="panel panel-default">
    <div class="panel-heading">
      Thông tin khách hàng
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
            <th>Tên khách hàng</th>
            <th>Địa chỉ</th>
            <th>Số điện thoại</th>
            
            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
            
          <tr>
            
            <td>{{$order_by_id->customer_name}}</td>
            <td>{{$order_by_id->address}}</td>
            <td>{{$order_by_id->phone_number}}</td>
            
          </tr>
          
        </tbody>
      </table>
    </div>
    
  </div>
</div>
@endsection