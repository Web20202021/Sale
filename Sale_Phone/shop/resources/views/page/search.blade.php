@extends('master')
@section('content')
<div class="container">
		<div id="content" class="space-top-none">
			<div class="main-content">
				<div class="space60">&nbsp;</div>
				<div class="row">
					<div class="col-sm-16">
						<div class="beta-products-list">
							<h4>Tìm kiếm</h4>
							<div class="beta-products-details">
								<p class="pull-left">Tìm thấy {{count($product)}} sản phẩm</p>
								<div class="clearfix"></div>
							</div>

							<div class="row">
							@foreach($product as $new)
								<div class="col-sm-4" style="width:240px;margin-top: 10px;">
									<div class="single-item">
									@if($new->promotion_price != 0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
									@endif
									@if($new->status == 0)
										<div class="single-item-header">
											<a href="{{route('chitietsanpham', $new->id)}}"><center><img src="edit-product/upload/product/{{$new->image_product}}" alt="" height="250px"></center></a>
										</div>
										<div class="single-item-body">
											<b><p class="single-item-title">{{$new->name}}</p></b>
											<p class="single-item-price" style="font-size: 13px">
											@if($new->promotion_price == 0)
												<span class="flash-sale">{{number_format($new->unit_price)}} đồng</span>
											@else
												<span class="flash-del">{{number_format($new->unit_price)}} đồng</span>
												<span class="flash-sale">{{number_format($new->promotion_price)}} đồng</span>
											@endif
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="{{route('themgiohang', $new->id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{route('chitietsanpham', $new->id)}}">Chi tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									@endif
									</div>
								</div>
							@endforeach
						</div> <!-- .beta-products-list -->
					</div>
				</div> <!-- end section with sidebar and main content -->


			</div> <!-- .main-content -->
		</div> <!-- #content -->
	</div>
@endsection