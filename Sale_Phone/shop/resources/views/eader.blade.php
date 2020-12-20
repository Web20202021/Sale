<div id="header">
		<div class="header-top">
			<div class="container">
				<div class="pull-left auto-width-left">
					<ul class="top-menu menu-beta l-inline">
						<li><a class="text-dark font-weight-bolder"><i class="fa fa-home"></i> 280 An Dương Vương, Phường 4, Quận 5, Thành phố Hồ Chí Minh</a></li>
						<li><a class="text-dark font-weight-bolder" href=""><i class="fa fa-phone"></i> 028 3835 2020</a></li>
					</ul>
				</div>
				<div class="pull-right auto-width-right">
					<ul class="top-details menu-beta l-inline">
					@if(Auth::check())
						<li><a class="text-dark"><b>Chào bạn {{Auth::user()->full_name}}</b></a></li>
						<li><a href="{{route('logout')}}"><b>Đăng xuất</b></a></li>
					@else
						<li><a href="{{route('signin')}}"><b>Đăng kí</b></a></li>
						<li><a href="{{route('login')}}"><b>Đăng nhập</b></a></li>
					@endif
					</ul>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
			</div> <!-- .header-top -->
		<div class="header-body">
			<div class="container beta-relative">
				<div class="pull-left">
					<a href="index.html" id="logo"><img src="https://upload.wikimedia.org/wikipedia/vi/thumb/8/8d/The_gioi_di_dong_logo.svg/1200px-The_gioi_di_dong_logo.svg.png" width="200px" height="50px" alt=""></a>
				</div>
				<div class="pull-right beta-components space-left ov">
					<div class="space10">&nbsp;</div>
					<div class="beta-comp">
						<form role="search" method="get" id="searchform" action="{{route('search')}}">
					        <input type="text" value="" name="key" id="s" placeholder="Bạn muốn tìm..." />
					        <button class="fa fa-search" type="submit" id="searchsubmit"></button>
						</form>
					</div>

					<div class="beta-comp">
					
						<div class="cart">
							<div class="beta-select"><i class="fa fa-shopping-cart"></i> Giỏ hàng (@if(Session::has('cart')){{Session('cart')->totalQty}} @else Trống @endif) <i class="fa fa-chevron-down"></i></div>
							@if(Session::has('cart'))
							<div class="beta-dropdown cart-body">
							@foreach($product_cart as $product)
								<div class="cart-item">
								<a class="cart-item-delete" href="{{route('xoagiohang', $product['item']['id'])}}"><i class="fa fa-times"></i></a>
									<div class="media">
									<a class="pull-left" href="#"><img src="source/image/product/{{$product['item']['image_cover']}}" alt=""></a>
										<div class="media-body">
											<span class="cart-item-title">{{$product['item']['name']}}</span>
											<span class="cart-item-amount">{{$product['qty']}}*<span>@if($product['item']['promotion_price'] == 0){{number_format($product['item']['unit_price'])}} đồng @else {{number_format($product['item']['promotion_price'])}} đồng @endif</span></span>
										</div>
									</div>
								</div>
							@endforeach
								<div class="cart-caption">
									<div class="cart-total text-right">Tổng tiền: <span class="cart-total-value">{{number_format(Session('cart')->totalPrice)}} đồng</span></div>
									<div class="clearfix"></div>

									<div class="center">
										<div class="space10">&nbsp;</div>
										<a href="{{route('dathang')}}" class="beta-btn primary text-center">Đặt hàng <i class="fa fa-chevron-right"></i></a>
									</div>
								</div>
							</div>
						</div> <!-- .cart -->
					@endif
					</div>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-body -->
		<div class="header-bottom" style="background-color: #ffc107">
			<div class="container">
				<a class="visible-xs beta-menu-toggle pull-right" href="#"><span class='beta-menu-toggle-text'>Menu</span> <i class="fa fa-bars"></i></a>
				<div class="visible-xs clearfix"></div>
				<nav class="main-menu">
					<ul style="color:#343a40" class="l-inline ov font-weight-bolder">
						<li><a href="{{route('trang-chu')}}">Trang chủ</a></li>
						<li>
						<a>Loại sản phẩm</a>
							<ul class="sub-menu">
							@foreach($loai_sp as $loai)
							@if($loai->type_status == 0)
								<li><a href="{{route('loaisanpham', $loai->type_id)}}">{{$loai->type_name}}</a></li>
							@endif
							@endforeach
							</ul>
						</li>
						<li><a href="{{route('gioithieu')}}">Giới thiệu</a></li>
						<li><a href="{{route('lienhe')}}">Liên hệ</a></li>
					</ul>
					<div class="clearfix"></div>
				</nav>
			</div> <!-- .container -->
		</div> <!-- .header-bottom -->
	</div> <!-- #header -->
	