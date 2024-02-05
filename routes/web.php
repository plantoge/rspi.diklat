<?php

use App\Http\Controllers\diklat\panel\beritaController;
use App\Http\Controllers\diklat\panel\beritaKategoriController;
use App\Http\Controllers\diklat\panel\eventController;
use App\Http\Controllers\diklat\panel\gambarController;
use App\Http\Controllers\diklat\panel\keunggulanController;
use App\Http\Controllers\diklat\panel\loginController;
use App\Http\Controllers\diklat\panel\orderController;
use App\Http\Controllers\diklat\panel\panelController;
use App\Http\Controllers\diklat\panel\reportEventController;
use App\Http\Controllers\diklat\panel\testimonyController;
use App\Http\Controllers\diklat\web\blogController;
use App\Http\Controllers\diklat\web\websiteController;
use App\Http\Controllers\ForgotPasswordController;
use Illuminate\Support\Facades\Route;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\User;

Route::get('/', [websiteController::class, 'beranda']);
Route::get('/kelas', [websiteController::class, 'kelas']);
Route::get('/info-kelas/{slug}/{id}', [websiteController::class, 'infokelas']);
Route::get('/about-us', [websiteController::class, 'aboutus']);
Route::get('/agenda', [websiteController::class, 'agenda']);
Route::get('/blog', [blogController::class, 'index']);
Route::get('/blog/{slug}', [blogController::class, 'show']);

Route::get('/auth-sign-in', [loginController::class, 'indexlogin'])->name('login');
Route::post('/auth-check-signin', [loginController::class, 'checksignin']);
Route::get('/auth-sign-up', [loginController::class, 'indexregister'])->name('register');
Route::post('/auth-post-signin', [loginController::class, 'postlogin']);
Route::post('/auth-post-signup', [loginController::class, 'postregister']);
Route::get('/auth-signout', [loginController::class, 'signout']);
Route::get('/auth-reset', [loginController::class, 'resetpass'])->name('reset-password');
// Route::post('/auth-reset-password', [ForgotPasswordController::class, 'sendlinkemail']);

// dashboard Pegawai
Route::get('/auth-login', 'AuthController@login');
Route::post('/postlogin', 'AuthController@postlogin');
Route::get('/regist', 'AuthController@register');
Route::post('/rstore', 'AuthController@store');
Route::get('/logout', 'AuthController@logout');

// dashboard customer
Route::group(['middleware' => ['checkrole:superadmin|visitor|operator']], function(){
    Route::get('/checkout-kelas/{slug}/{id}', [websiteController::class, 'cokelas'])->name('checkout-kelas');
    Route::post('/checkout-kelas-proses', [websiteController::class, 'store_cokelas']);

    Route::get('/panel', [panelController::class, 'panel']);
    Route::patch('/panel-informasi/store', [panelController::class, 'store_informasi']);
    
    Route::get('/panel-testimony', [testimonyController::class, 'index']);
    Route::get('/panel-testimony/create', [testimonyController::class, 'create'])->name('create-testimony');
    Route::post('/panel-testimony/store', [testimonyController::class, 'store'])->name('store-testimony');
    Route::get('/panel-testimony/{id}/edit', [testimonyController::class, 'edit'])->name('edit-testimony');
    Route::patch('/panel-testimony/{id}/update', [testimonyController::class, 'update'])->name('update-testimony');
    Route::delete('/panel-testimony/{id}/delete', [testimonyController::class, 'destroy']);

    Route::get('/panel-berita-kategori', [beritaKategoriController::class, 'index']);
    Route::get('/panel-berita-kategori/create', [beritaKategoriController::class, 'create'])->name('create-berita-kategori');
    Route::post('/panel-berita-kategori/store', [beritaKategoriController::class, 'store'])->name('store-berita-kategori');
    Route::get('/panel-berita-kategori/{id}/edit', [beritaKategoriController::class, 'edit'])->name('edit-berita-kategori');
    Route::patch('/panel-berita-kategori/{id}/update', [beritaKategoriController::class, 'update'])->name('update-berita-kategori');
    Route::delete('/panel-berita-kategori/{id}/delete', [beritaKategoriController::class, 'destroy']);

    Route::get('/panel-berita', [beritaController::class, 'index']);
    Route::get('/panel-berita/create', [beritaController::class, 'create'])->name('create-berita');
    Route::post('/panel-berita/store', [beritaController::class, 'store'])->name('store-berita');
    Route::get('/panel-berita/{id}/edit', [beritaController::class, 'edit'])->name('edit-berita');
    Route::get('/panel-berita/{id}/view', [beritaController::class, 'show'])->name('view-berita');
    Route::patch('/panel-berita/{id}/update', [beritaController::class, 'update'])->name('update-berita');
    Route::delete('/panel-berita/{id}/delete', [beritaController::class, 'destroy']);

    Route::get('/panel-gambar', [gambarController::class, 'index']);
    Route::get('/panel-gambar/create', [gambarController::class, 'create'])->name('create-gambar');
    Route::post('/panel-gambar/store', [gambarController::class, 'store'])->name('store-gambar');
    Route::get('/panel-gambar/{id}/edit', [gambarController::class, 'edit'])->name('edit-gambar');
    Route::patch('/panel-gambar/{id}/update', [gambarController::class, 'update'])->name('update-gambar');
    Route::delete('/panel-gambar/{id}/delete', [gambarController::class, 'destroy']);

    Route::get('/panel-keunggulan', [keunggulanController::class, 'index']);
    Route::get('/panel-keunggulan/create', [keunggulanController::class, 'create'])->name('create-keunggulan');
    Route::post('/panel-keunggulan/store', [keunggulanController::class, 'store'])->name('store-keunggulan');
    Route::get('/panel-keunggulan/{id}/edit', [keunggulanController::class, 'edit'])->name('edit-keunggulan');
    Route::patch('/panel-keunggulan/{id}/update', [keunggulanController::class, 'update'])->name('update-keunggulan');
    Route::delete('/panel-keunggulan/{id}/delete', [keunggulanController::class, 'destroy']);

    Route::get('/events', [eventController::class, 'index']);
    Route::get('/events/create', [eventController::class, 'create'])->name('create-event');
    Route::post('/events/store', [eventController::class, 'store'])->name('store-event');
    Route::get('/events/{id}/edit', [eventController::class, 'edit'])->name('edit-event');
    Route::patch('/events/{id}/update', [eventController::class, 'update'])->name('update-event');
    Route::delete('/events/{id}/delete', [eventController::class, 'destroy'])->name('delete-event');
    Route::get('/order', [orderController::class, 'index']);
    Route::get('/antrian-order', [orderController::class, 'antrianorder']);
    Route::get('/order-proses/{order_id}', [orderController::class, 'konfirmasiorder']);
    Route::get('/order-invoice/{order_id}', [orderController::class, 'invoice']);
    
    Route::get('/report', [reportEventController::class, 'index']);
    Route::get('/report-filter', [reportEventController::class, 'filter']);
});

Route::group(['middleware' => ['checkrole:superadmin']], function(){
    Route::get('dashboard', 'DashboardController@index');

    // CRUD ROLE
    Route::get('role', 'roleController@index');
    Route::post('role/store', 'roleController@store');
    Route::patch('role/{id}/update', 'roleController@update');
    Route::delete('role/{id}/delete', 'roleController@destroy');
    
    // CRUD PERMISSION
    Route::get('permission', 'permissionController@index');
    Route::post('permission/store', 'permissionController@store');
    Route::patch('permission/{id}/update', 'permissionController@update');
    Route::delete('permission/{id}/delete', 'permissionController@destroy');
    
    // CRUD AKSES ASSIGNROLE
    Route::get('assignrole', 'assignroleController@index');
    Route::get('assignrole/{id}/create', 'assignroleController@create');
    Route::post('assignrole/store', 'assignroleController@store');
    Route::get('assignrole/{id}/edit', 'assignroleController@edit');
    Route::patch('assignrole/{id}/update', 'assignroleController@update');
    
    // CRUD AKSES GIVEPERMISSION
    Route::get('givepermission', 'givepermissionController@index');
    Route::get('givepermission/{id}/create', 'givepermissionController@create');
    Route::post('givepermission/{id}/store', 'givepermissionController@store');
    Route::get('givepermission/{id}/edit', 'givepermissionController@edit');
    Route::patch('givepermission/{id}/update', 'givepermissionController@update');
    
    Route::get('users', 'usersController@index');
    Route::post('users/store', 'usersController@store');
    Route::patch('users/{id}/update', 'usersController@update');
    Route::delete('users/{id}/delete', 'usersController@destroy');

    // CRUD STRUKTUR ORGANISASI
    Route::get('struktur-organisasi', 'strukturOrganisasiController@index');
    Route::post('struktur-organisasi/store-pimpinan', 'strukturOrganisasiController@storepimpinan');
    Route::post('struktur-organisasi/has-user', 'strukturOrganisasiController@hasusersotk');
    Route::get('struktur-organisasi/has-user-sotk/empty', 'strukturOrganisasiController@hasusersotkempty');
    Route::post('struktur-organisasi/filter-satu', 'strukturOrganisasiController@filtersatu');
    Route::post('struktur-organisasi/filter-dua', 'strukturOrganisasiController@filterdua');
    Route::post('struktur-organisasi/filter-tiga', 'strukturOrganisasiController@filtertiga');
    Route::post('struktur-organisasi/store', 'strukturOrganisasiController@store');
    Route::get('struktur-organisasi/{id}/edit', 'strukturOrganisasiController@edit');
    Route::patch('struktur-organisasi/{id}/update', 'strukturOrganisasiController@update');
    Route::delete('struktur-organisasi/{id}/delete', 'strukturOrganisasiController@destroy');
});

// Route::group(['middleware' => ['auth',                   'checkrole:superadmin|bendahara_penerimaan|bendahara_pengeluaran|penjamin|anggaran|checklist_tagihan|pengadaan|hutang|pajak|PPKBLU|PPKRM|PPSPM|Kasir']], function(){
    
Route::group(['middleware' => ['auth']], function(){
    // TIDAK BOLEH DI HAPUS ===============================================  Route::get('/dashboard', 'DashboardController@index');
    Route::get('/setelan', 'SetelanController@index');
    Route::patch('update-email', 'SetelanController@updateemail');
    Route::patch('update-password', 'SetelanController@updatepassword');
    // TIDAK BOLEH DI HAPUS ===============================================  Route::get('/dashboard', 'DashboardController@index');
});