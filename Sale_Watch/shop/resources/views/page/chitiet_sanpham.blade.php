@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản phẩm {{$sanpham->name}}</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Trang chủ</a> / <span>Thông tin chi tiết sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="container">
		<div id="content">
			<div class="row">
				<div class="col-sm-9">

					<div class="row">
						<div class="col-sm-4">
							<img src="edit-product/upload/product/{{$sanpham->image}}" alt="">
						</div>
						<div class="col-sm-8">
							<div class="single-item-body">
								<p class="single-item-title"><h2>{{$sanpham->name}}</h2></p>
								<p class="single-item-price">
								@if($sanpham->promotion_price == 0)
									<span class="flash-sale">{{number_format($sanpham->unit_price)}} đồng</span>
								@else
									<span class="flash-del">{{number_format($sanpham->unit_price)}} đồng</span>
									<span class="flash-sale">{{number_format($sanpham->promotion_price)}} đồng</span>
								@endif
								</p>
							</div>

							<div class="clearfix"></div>
							<div class="space20">&nbsp;</div>

							<div class="single-item-desc">
								<p>{{$sanpham->description}}</p>
							</div>
							<div class="space20">&nbsp;</div>
							<div>
								<a class="beta-btn primary" href="{{route('themgiohang', $sanpham->id)}}"><b>Mua ngay</b><i class="fa fa-chevron-right"></i></a>
								<a class="add-to-cart pull-left" href="{{route('themgiohang', $sanpham->id)}}"><i class="fa fa-shopping-cart"></i></a>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="space40">&nbsp;</div>
					<div class="woocommerce-tabs">
						<ul class="tabs">
							<li><a href="#tab-description">Thông số kỹ thuật</a></li>
						</ul>
						<div class="panel" id="tab-description">
							- Thương hiệu: {{$sanpham->trademark}}
						<br>- Mã sản phẩm: {{$sanpham->code_product}}
						<br>- Giới tính: {{$sanpham->gender}}
						<br>- Kính: {{$sanpham->glass_type}}
						<br>- Máy: {{$sanpham->system}}
						<br>- Đường kính mặt số: {{$sanpham->the_dial_diameter}}
						<br>- Bề dày mặt số: {{$sanpham->number_surface_thickness}}
						<br>- Dây đeo: {{$sanpham->strap}}
						<br>- Màu mặt số: {{$sanpham->dial_color}}
						<br>- Chức năng: {{$sanpham->function}}
						</div>
					</div>
					<div class="space50">&nbsp;</div>
					<div class="beta-products-list">
						<h4>Sản phẩm khác</h4>

						<div class="row">
							@foreach($sp_khac as $spk)
							<div class="col-sm-4">
								<div class="single-item">
								@if($spk->promotion_price != 0)
									<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
								@endif
									<div class="single-item-header">
										<a href="{{route('chitietsanpham', $spk->id)}}"><img src="edit-product/upload/product/{{$spk->image}}" alt=""></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title"><b>{{$spk->name}}</b></p>
										<p class="single-item-price" style="font-size: 13px">
										@if($spk->promotion_price == 0)
												<span class="flash-sale">{{number_format($spk->unit_price)}} đồng</span>
											@else
												<span class="flash-del">{{number_format($spk->unit_price)}} đồng</span>
												<span class="flash-sale">{{number_format($spk->promotion_price)}} đồng</span>
											@endif
										</p>
									</div>
									<div class="single-item-caption">
									<a class="add-to-cart pull-left" href="{{route('themgiohang', $spk->id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{route('chitietsanpham', $spk->id)}}">Chi tiết<i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							@endforeach
							<div class="row">{{$sp_khac->links()}}</div>
						</div>
					</div> <!-- .beta-products-list -->
				</div>
				<div class="col-sm-3 aside">
					<div class="widget">
						<h3 class="widget-title">Sản phẩm tương tự</h3>
						<div class="widget-body">
							<div class="beta-sales beta-lists">
							@foreach($sp_tuongtu as $sptt)
								<div class="media beta-sales-item">
									<a class="pull-left" href="{{route('chitietsanpham', $sptt->id)}}"><img src="edit-product/upload/product/{{$sptt->image}}" alt=""></a>
									<div class="media-body">
										{{$sptt->name}}
										<span class="beta-sales-price single-item-price" style="font-size: 13px">
										<br>
										@if($sptt->promotion_price == 0)
											<span class="flash-sale">{{number_format($sptt->unit_price)}} đồng</span>
										@else
											<span class="flash-del">{{number_format($sptt->unit_price)}} đồng</span>
											<span class="flash-sale">{{number_format($sptt->promotion_price)}} đồng</span>
										@endif
										</span>
									</div>
								</div>
							@endforeach
							</div>
						</div>
					</div> <!-- best sellers widget -->
					<div class="widget">
						<h3 class="widget-title">Sản phẩm bán chạy</h3>
						<div class="widget-body">
							<div class="beta-sales beta-lists">
								@foreach($sp_banchay as $sptt)
									<div class="media beta-sales-item">
										<a class="pull-left" href="{{route('chitietsanpham', $sptt->id)}}"><img src="edit-product/upload/product/{{$sptt->image}}" alt=""></a>
										<div class="media-body">
											{{$sptt->name}}
											<span class="beta-sales-price single-item-price" style="font-size: 13px">
											<br>
											@if($sptt->promotion_price == 0)
												<span class="flash-sale">{{number_format($sptt->unit_price)}} đồng</span>
											@else
												<span class="flash-del">{{number_format($sptt->unit_price)}} đồng</span>
												<br>
												<span class="flash-sale">{{number_format($sptt->promotion_price)}} đồng</span>
											@endif
											</span>
										</div>
									</div>
								@endforeach
							</div>
						</div>
					</div> <!-- best sellers widget -->
				</div>
			</div>
		</div> <!-- #content -->
    </div> <!-- .container -->
@endsection