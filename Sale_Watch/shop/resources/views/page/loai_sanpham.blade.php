@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản phẩm {{$loai_sp->type_name}}</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Trang chủ</a> / <span>Loại sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			<div class="main-content">
				<div class="space60">&nbsp;</div>
				<div class="row">
					<div class="col-sm-3">
						<ul class="aside-menu">
						@foreach($loai as $l)
							<li><a href="{{route('loaisanpham', $l->type_id)}}">{{$l->type_name}}</a></li>
						@endforeach
						</ul>
					</div>
					<div class="col-sm-9">
						<div class="beta-products-list">
							<h4>{{$loai_sp->type_name}}</h4>
							<div class="beta-products-details">
								<p class="pull-left">Tìm thấy {{count($sp_theoloai)}} sẩn phẩm</p>
								<div class="clearfix"></div>
							</div>

							<div class="row">
							@foreach($sp_theoloai as $sp)
								<div class="col-sm-2" style="width:240px;margin-top: 10px;">
									<div class="single-item">
									@if($sp->promotion_price != 0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
									@endif
										<div class="single-item-header">
											<a href="{{route('chitietsanpham', $sp->id)}}"><center><img src="edit-product/upload/product/{{$sp->image}}" alt="" height="250px"></center></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title" style="font-size: 13px"><b>{{$sp->name}}</b></p>
											<p class="single-item-price" style="font-size: 10px">
											@if($sp->promotion_price != 0)
											<span class="flash-del">{{number_format($sp->unit_price)}} đồng</span>
												<span class="flash-sale">{{number_format($sp->promotion_price)}} đồng</span>
											@else
											<span>{{number_format($sp->unit_price)}} đồng</span>
											@endif
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="{{route('themgiohang', $sp->id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{route('chitietsanpham', $sp->id)}}">Chi tiết<i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							@endforeach
							</div>
						</div> <!-- .beta-products-list -->

						<div class="space50">&nbsp;</div>

						<div class="beta-products-list">
							<h4>Sản phẩm khác</h4>
							<div class="beta-products-details">
								<p class="pull-left">Tìm thấy {{count($sp_khac)}}</p>
								<div class="clearfix"></div>
							</div>
							<div class="row">
							@foreach($sp_khac as $sp_k)
								<div class="col-sm-4">
									<div class="single-item">
									@if($sp_k->promotion_price != 0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
									@endif
										<div class="single-item-header">
											<a href="product.html"><center><img src="edit-product/upload/product/{{$sp_k->image}}" alt="" height="250px"></center></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title"><b>{{$sp_k->name}}</b></p>
											<p class="single-item-price" style="font-size: 13px">
											@if($sp_k->promotion_price != 0)
											<span class="flash-del">{{number_format($sp_k->unit_price)}} đồng</span>
												<span class="flash-sale">{{number_format($sp_k->promotion_price)}} đồng</span>
											@else
											<span>{{number_format($sp_k->unit_price)}} đồng</span>
											@endif
											</p>
										</div>
										<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="{{route('themgiohang', $sp_k->id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{route('chitietsanpham', $sp_k->id)}}">Chi tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							@endforeach
							</div>
							<div>{{$sp_khac->links()}}</div>
							<div class="space40">&nbsp;</div>
							
						</div> <!-- .beta-products-list -->
					</div>
				</div> <!-- end section with sidebar and main content -->


			</div> <!-- .main-content -->
		</div> <!-- #content -->
    </div> <!-- .container -->
@endsection