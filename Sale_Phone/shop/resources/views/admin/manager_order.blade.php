@extends('admin_layout')
@section('admin_content')
<div class="table-agile-info">
<div class="panel panel-default">
    <div class="panel-heading">
      Liệt kê đơn hàng
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
            <th>Tên người đặt hàng</th>
            <th>Tổng giá tiền</th>
            <th>Tình trạng đơn hàng</th>
            <th>Ghi chú</th>
            <th>Phương thức thanh toán</th>
            <th>Hiển thị</th>
            
            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
            @foreach($all_order as $key => $order)
          <tr>
            <td><label class="i-checks m-b-none"><input type="checkbox" name="post[]"><i></i></label></td>
            <td>{{$order->customer_name}}</td>
            <td>{{$order->total}}</td>
            <td>
            {{$order->bill_status}}
            </td>
            <td>{{$order->note}}</td>
            <td>{{$order->payment}}</td>
            <td><span class="text-ellipsis">
            <?php
                if($order->bill_status == "Đang chờ xử lý"){
            ?>
                <a href="{{URL::to('/unactive-order/'.$order->id)}}"><span class="fa-thumb-style fa fa-lightbulb-o"></span></a>
            <?php
            }else{?>
                <a href="{{URL::to('/active-order/'.$order->id)}}"><span class="fa-thumb-styling fa fa-lightbulb-o"></span></a>
            <?php
            }
            ?>
            </span></td>
            <td>
              <a href="{{URL::to('/view-order/'.$order->id)}}" class="active styling-edit" ui-toggle-class="">
              <i class="fa fa-pencil-square-o text-success text-active"></i></a>
              <a onClick="return confirm('Bạn có chắc muốn xóa đơn hàng này không?')" href="{{URL::to('/delete-order/'.$order->id)}}" class="active styling-delete" ui-toggle-class="">
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