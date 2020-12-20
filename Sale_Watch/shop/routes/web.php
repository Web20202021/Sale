<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('index', [
    'as'=>'trang-chu',
    'uses'=>'App\Http\Controllers\PageController@getIndex'
]);

Route::get('#', [
    'as'=>'trang-chu',
    'uses'=>'App\Http\Controllers\PageController@getIndex'
]);

Route::get('/', [
    'as'=>'trang-chu',
    'uses'=>'App\Http\Controllers\PageController@getIndex'
]);

Route::get('loai-san-pham/{type}', [
    'as'=>'loaisanpham',
    'uses'=>'App\Http\Controllers\PageController@getLoaiSp'
]);

Route::get('chi-tiet-san-pham/{id}', [
    'as'=>'chitietsanpham',
    'uses'=>'App\Http\Controllers\PageController@getChitiet'
]);

Route::get('lien-he', [
    'as'=>'lienhe',
    'uses'=>'App\Http\Controllers\PageController@getLienHe'
]);

Route::get('gioi-thieu', [
    'as'=>'gioithieu',
    'uses'=>'App\Http\Controllers\PageController@getGioiThieu'
]);

Route::get('add-to-cart/{id}', [
    'as'=>'themgiohang',
     'uses'=>'App\Http\Controllers\PageController@getAddtoCart'
]);

Route::get('del-cart/{id}', [
    'as'=>'xoagiohang',
    'uses'=>'App\Http\Controllers\PageController@getDelItemCart'
]);

Route::get('dat-hang', [
    'as'=>'dathang',
    'uses'=>'App\Http\Controllers\PageController@getCheckout'
]);

Route::post('dat-hang', [
    'as'=>'dathang',
    'uses'=>'App\Http\Controllers\PageController@postCheckout'
]);

Route::get('dang-nhap', [
    'as'=>'login',
    'uses'=>'App\Http\Controllers\PageController@getLogin'
]);

Route::post('dang-nhap', [
    'as'=>'login',
    'uses'=>'App\Http\Controllers\PageController@postLogin'
]);

Route::get('dang-ki', [
    'as'=>'signin',
    'uses'=>'App\Http\Controllers\PageController@getSignin'
]);

Route::post('dang-ki', [
    'as'=>'signin',
    'uses'=>'App\Http\Controllers\PageController@postSignin'
]);

Route::get('dang-xuat', [
    'as'=>'logout',
    'uses'=>'App\Http\Controllers\PageController@postLogout'
]);

Route::get('Search',[
    'as'=>'search',
    'uses'=>'App\Http\Controllers\PageController@getSearch'
]);

Route::get('/admin', 'App\Http\Controllers\AdminController@index');
Route::get('/dashboard', 'App\Http\Controllers\AdminController@show_dashboard');
Route::get('/logout', 'App\Http\Controllers\AdminController@logout');
Route::post('/admin-dashboard', 'App\Http\Controllers\AdminController@dashboard');

Route::get('/add-category-product', 'App\Http\Controllers\categoryProduct@add_category_product');
Route::get('/edit-category-product/{category_product_id}', 'App\Http\Controllers\categoryProduct@edit_category_product');
Route::get('/delete-category-product/{category_product_id}', 'App\Http\Controllers\categoryProduct@delete_category_product');
Route::get('/all-category-product', 'App\Http\Controllers\categoryProduct@all_category_product');

Route::get('/unactive-category-product/{category_product_id}', 'App\Http\Controllers\categoryProduct@unactive_category_product');
Route::get('/active-category-product/{category_product_id}', 'App\Http\Controllers\categoryProduct@active_category_product');

Route::post('/save-category-product', 'App\Http\Controllers\categoryProduct@save_category_product');
Route::post('/update-category-product/{category_product_id}', 'App\Http\Controllers\categoryProduct@update_category_product');

//Product
Route::get('/add-product', 'App\Http\Controllers\ProductController@add_product');
Route::get('/edit-product/{product_id}', 'App\Http\Controllers\ProductController@edit_product');
Route::get('/delete-product/{product_id}', 'App\Http\Controllers\ProductController@delete_product');
Route::get('/all-product', 'App\Http\Controllers\ProductController@all_product');

Route::get('/unactive-product/{product_id}', 'App\Http\Controllers\ProductController@unactive_product');
Route::get('/active-product/{product_id}', 'App\Http\Controllers\ProductController@active_product');

Route::post('/save-product', 'App\Http\Controllers\ProductController@save_product');
Route::post('update-product/{product_id}', 'App\Http\Controllers\ProductController@update_product');

Route::get('/manager-order', 'App\Http\Controllers\CheckOutController@manager_order');
Route::get('/view-order/{order_id}', 'App\Http\Controllers\CheckOutController@view_order');
Route::get('/unactive-order/{order_id}', 'App\Http\Controllers\CheckOutController@unactive_order');
Route::get('/active-order/{order_id}', 'App\Http\Controllers\CheckOutController@active_order');
