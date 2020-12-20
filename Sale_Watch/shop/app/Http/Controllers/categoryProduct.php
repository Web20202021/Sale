<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests;
use DB;
use Session;
Session_start();

class categoryProduct extends Controller
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

    public function add_category_product(){
        $this->AuthLogin();
        return view('admin.add_category_product');
    }

    public function all_category_product(){
        $this->AuthLogin();
        $all_category_product = DB::table('type_products')->orderby('type_id', 'desc')->get();
        $manager_category_product = view('admin.all_category_product')->with('all_category_product', $all_category_product);
        return view('admin_layout')->with('admin.all_category_product', $manager_category_product);
    }

    public function save_category_product(Request $request){
        $this->AuthLogin();
        $data = array();
        $data['type_name'] = $request->category_product_name;
        $data['description'] = $request->category_product_desc;
        $data['type_status'] = $request->category_product_status;

        DB::table('type_products')->insert($data);
        Session::put('message', 'Thêm danh mục sản phẩm thành công');
        return Redirect::to('all-category-product');
    }

    public function unactive_category_product($category_product_id){
        $this->AuthLogin();
        DB::table('type_products')->where('type_id', $category_product_id)->update(['type_status'=>1]);
        Session::put('message', 'Ẩn thành công');
        return Redirect::to('all-category-product');
    }

    public function active_category_product($category_product_id){
        $this->AuthLogin();
        DB::table('type_products')->where('type_id', $category_product_id)->update(['type_status'=>0]);
        Session::put('message', 'Hiển thị thành công');
        return Redirect::to('all-category-product');
    }

    public function edit_category_product($category_product_id){
        $this->AuthLogin();
        $edit_category_product = DB::table('type_products')->where('type_id', $category_product_id)->get();
        $manager_category_product = view('admin.edit_category_product')->with('edit_category_product', $edit_category_product);
        return view('admin_layout')->with('admin.edit_category_product', $manager_category_product);
    }

    public function update_category_product(Request $request, $category_product_id){
        $this->AuthLogin();
        $data= array();
        $data['type_name'] = $request->category_product_name;
        $data['description'] = $request->category_product_desc;
        DB::table('type_products')->where('type_id', $category_product_id)->update($data);
        Session::put('message', 'Cập nhật danh mục sản phẩm thành công');
        return Redirect::to('all-category-product');
    }

    public function delete_category_product($category_product_id){
        $this->AuthLogin();
        DB::table('type_products')->where('type_id', $category_product_id)->delete();
        Session::put('message', 'Xóa danh mục sản phẩm thành công');
        return Redirect::to('all-category-product');
    }
}
