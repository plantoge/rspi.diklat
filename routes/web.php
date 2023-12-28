<?php

use App\Http\Controllers\diklat\panel\loginController;
use App\Http\Controllers\diklat\web\websiteController;
use Illuminate\Support\Facades\Route;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\User;

Route::get('/', [websiteController::class, 'beranda']);
Route::get('/kelas', [websiteController::class, 'kelas']);
Route::get('/info-kelas/{slug}/{id}', [websiteController::class, 'infokelas']);
Route::get('/checkout-kelas/{slug}/{id}', [websiteController::class, 'cokelas']);
Route::get('/about-us', [websiteController::class, 'aboutus']);
Route::get('/agenda', [websiteController::class, 'agenda']);
Route::post('/auth-post-signin', [loginController::class, 'postlogin']);
Route::get('/auth-signout', [loginController::class, 'signout']);

// dashboard Pegawai
Route::get('/auth-login', 'AuthController@login');
Route::post('/postlogin', 'AuthController@postlogin');
Route::get('/regist', 'AuthController@register');
Route::post('/rstore', 'AuthController@store');
Route::get('/logout', 'AuthController@logout');

// dashboard customer
Route::group(['middleware' => ['checkrole:superadmin']], function(){
    Route::get('/panel', [websiteController::class, 'admin']);
});

Route::group(['middleware' => ['checkrole:superadmin']], function(){
    Route::get('dashboard', 'dashboardController@index');

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