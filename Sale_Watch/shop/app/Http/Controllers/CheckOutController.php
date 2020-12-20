<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests;
use DB;
use Session;
Session_start();

class CheckOutController extends Controller
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

    public function manager_order(){
        $this->AuthLogin();
        $all_order = DB::table('bills')
        ->join('customer', 'bills.id_customer', '=', 'customer.id')
        ->select('bills.*', 'customer.customer_name')
        ->orderby('bills.id', 'desc')->get();
        $all_product_2 = DB::table('products')->orderby('id', 'desc')->get();
        $manager_order = view('admin.manager_order')->with('all_order', $all_order);
        return view('admin_layout')->with('admin.manager_order', $manager_order);
    }

    public function view_order($order_id){
        $this->AuthLogin();
        $order_by_id = DB::table('bills')
        ->join('customer', 'bills.id_customer', '=', 'customer.id')
        ->where('bills.id', $order_id)
        ->select('bills.*', 'customer.*')
        ->first();
        
        $order_customer = DB::table('bills')
        ->join('customer', 'bills.id_customer', '=', 'customer.id')
        ->where('bills.id', $order_id)
        ->select('bills.id')->first();
        $order = DB::table('bill_detail')
        ->join('bills', 'bills.id', '=', 'bill_detail.id_bill')
        ->join('products', 'products.id', '=', 'bill_detail.id_product')
        ->where('bill_detail.id_bill', $order_customer->id)
        ->select('bill_detail.*', 'products.name')->get();
        $manager_order_by_id = view('admin.view_order')->with('order_by_id', $order_by_id)->with('order', $order);
        return view('admin_layout')->with('admin.view_order', $manager_order_by_id);
    }

    public function unactive_order($order_id){
        $this->AuthLogin();
        DB::table('bills')->where('id', $order_id)->update(['bill_status'=>"Đã xử lý"]);
        Session::put('message', 'Thay đổi trạng thái thành công');
        return Redirect::to('manager-order');
    }

    public function active_order($order_id){
        $this->AuthLogin();
        DB::table('bills')->where('id', $order_id)->update(['bill_status'=>"Đang chờ xử lý"]);
        Session::put('message', 'Thay đổi trạng thái thành công');
        return Redirect::to('manager-order');
    }
}

?>