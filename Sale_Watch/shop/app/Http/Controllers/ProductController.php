<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests;
use DB;
use Session;
Session_start();

class ProductController extends Controller
{
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }
        else{
            return Redirect::to('admin')->send();
        }
    }

    public function add_product(){
        $this->AuthLogin();
        $brand_product = DB::table('type_products')->orderby('type_id', 'asc')->get();
        
        return view('admin.add_product')->with('brand_product', $brand_product);
    }

    public function all_product(){
        $this->AuthLogin();
        $all_product = DB::table('products')
        ->join('type_products', 'type_products.type_id', '=', 'products.id_type')
        ->orderby('products.id', 'desc')->get();
        $all_product_2 = DB::table('products')->orderby('id', 'desc')->get();
        $manager_product = view('admin.all_product')->with('all_product', $all_product)->with('all_product_2', $all_product_2);
        return view('admin_layout')->with('admin.all_product', $manager_product);
    }

    public function save_product(Request $request){
        $this->AuthLogin();
        $data = array();
        $data['name'] = $request->name;
        $data['status'] = $request->status;
        $data['id_type'] = $request->brand;
        $data['system'] = $request->system;
        $data['code_product'] = $request->code_product;
        $data['gender'] = $request->gender;
        $data['glass_type'] = $request->glass_type;
        $data['the_dial_diameter'] = $request->the_dial_diameter;
        $data['number_surface_thickness'] = $request->number_surface_thickness;
        $data['strap'] = $request->strap;
        $data['dial_color'] = $request->dial_color;
        $data['function'] = $request->function;
        $data['description'] = $request->description;
        $data['unit_price'] = $request->unit_price;
        $data['promotion_price'] = $request->promotion_price;
        $data['unit'] = "máy";
        $data['new'] = "0";
        $get_image = $request->file('image');
        
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image = $name_image.rand(0, 99).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('edit-product/upload/product', $new_image);
            
            $data['image'] = $new_image;            
            DB::table('products')->insert($data);
            Session::put('message', 'Thêm sản phẩm thành công');
            return Redirect::to('add-product');
        }

        $data['image'] = '';
        DB::table('products')->insert($data);
        Session::put('message', 'Thêm sản phẩm thành công');
        return Redirect::to('all-product');
    }

    public function unactive_product($product_id){
        $this->AuthLogin();
        DB::table('products')->where('id', $product_id)->update(['status'=>1]);
        Session::put('message', 'Ẩn thành công');
        return Redirect::to('all-product');
    }

    public function active_product($product_id){
        $this->AuthLogin();
        DB::table('products')->where('id', $product_id)->update(['status'=>0]);
        Session::put('message', 'Hiển thị thành công');
        return Redirect::to('all-product');
    }

    public function edit_product($product_id){
        $this->AuthLogin();
        $brand_product = DB::table('type_products')->orderby('type_id', 'asc')->get();
        $edit_product = DB::table('products')->where('id', $product_id)->get();
        $manager_product = view('admin.edit_product')->with('edit_product', $edit_product)->with('brand_product', $brand_product);
        return view('admin_layout')->with('admin.edit_product', $manager_product);
    }

    public function update_product(Request $request, $product_id){
        $this->AuthLogin();
        $data = array();
        $data['name'] = $request->name;
        $data['status'] = $request->status;
        $data['id_type'] = $request->brand;
        $data['system'] = $request->system;
        $data['code_product'] = $request->code_product;
        $data['gender'] = $request->gender;
        $data['glass_type'] = $request->glass_type;
        $data['the_dial_diameter'] = $request->the_dial_diameter;
        $data['number_surface_thickness'] = $request->number_surface_thickness;
        $data['strap'] = $request->strap;
        $data['dial_color'] = $request->dial_color;
        $data['function'] = $request->function;
        $data['description'] = $request->description;
        $data['unit_price'] = $request->unit_price;
        $data['promotion_price'] = $request->promotion_price;
        $data['unit'] = "máy";
        $data['new'] = "0";
        $get_image = $request->file('image');
        
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image = $name_image.rand(0, 99).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('edit-product/upload/product', $new_image);
            
            $data['image'] = $new_image;            
            DB::table('products')->where('id', $product_id)->update($data);
            Session::put('message', 'Cập nhật sản phẩm thành công');
            return Redirect::to('all-product');
        }

        DB::table('products')->where('id', $product_id)->update($data);
        Session::put('message', 'Cập nhật sản phẩm thành công');
        return Redirect::to('all-product');
    }

    public function delete_product($product_id){
        $this->AuthLogin();
        DB::table('products')->where('id', $product_id)->delete();
        Session::put('message', 'Xóa sản phẩm thành công');
        return Redirect::to('all-product');
    }
}
