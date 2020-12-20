@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Liên Hệ</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="index.html">Trang chủ</a> / <span>Liên hệ</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="beta-map">
		
		<div class="abs-fullwidth beta-map wow flipInX"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.655751067763!2d106.68040551425631!3d10.760992062422275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f1b8e6575c3%3A0x48d253bde1931e59!2zxJDhuqFpIGjhu41jIFPGsCBQaOG6oW0!5e0!3m2!1svi!2s!4v1607493765535!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></div>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			
			<div class="space50">&nbsp;</div>
			<div class="row">
				<div class="col-sm-8">
					<h3><b>THẾ GIỚI DI ĐỘNG XIN HÂN HẠNH<br> ĐƯỢC HỖ TRỢ QUÝ KHÁCH</b></h3>
					<div class="space20">&nbsp;</div>
					<form action="#" method="post" class="contact-form">	
						<div class="form-block">
							<input name="your-name" type="text" placeholder="Họ và tên (bắt buộc)">
						</div>
						<div class="form-block">
							<input name="your-email" type="email" placeholder="Email (bắt buộc)">
						</div>
						<div class="form-block">
							<input name="your-subject" type="text" placeholder="Tiêu đề">
						</div>
						<div class="form-block">
							<textarea name="your-message" placeholder="Nội dung"></textarea>
						</div>
						<div class="form-block">
							<button type="submit" class="beta-btn primary">Gửi<i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
				</div>
				<div class="col-sm-4">
					<h2><b>Thông Tin Liên Hệ</b></h2>
					<div class="space20">&nbsp;</div>

					<h6 class="contact-title">Địa chỉ</h6>
					<p>
						280 An Dương Vương, Phường 4, Quận 5, TP.HCM<br>
						222 Lê Văn Sỹ, Phường 14, Quận 3, TP.HCM <br>
					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Hợp tác kinh doanh</h6>
					<p>
						Your potential. Our passion<br>
						Tiềm năng của bạn. Niềm đam mê của chúng tôi<br>
						<a href="mailto:investor@thegioididong.com">investor@thegioididong.com</a>
					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Tuyển dụng</h6>
					<p>
						Luôn chào đón bạn đến với đội ngũ của chúng tôi! <br>
						<a href="https://vieclam.thegioididong.com/">https://vieclam.thegioididong.com/</a>
					</p>
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection