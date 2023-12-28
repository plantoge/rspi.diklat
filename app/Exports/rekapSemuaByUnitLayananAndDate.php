<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Support\Facades\DB;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class rekapSemuaByUnitLayananAndDate implements FromView
{
    protected $idul;
    protected $date;
    protected $user;

    function __construct($idul, $date, $user) {
        $this->idul = $idul;
        $this->date = $date;
        $this->user = $user;
    }

    public function view(): View
    {
        $unit_layanan = DB::table('benpen')
            ->join('tindakan', 'tindakan.id', '=', 'benpen.tindakan_id')
            ->join('unit_layanan', 'unit_layanan.id', '=', 'tindakan.unit_layanan_id')
            ->selectRaw('tindakan.tindakan, benpen.tanggal_kuitansi, tindakan.satuan, tindakan.tarif, unit_layanan.layanan, benpen.harga')
            // ->where('tindakan.pemilik', '=', 1)
            ->where('unit_layanan_id', $this->idul)
            ->whereDate('benpen.tanggal_kuitansi', $this->date)
            ->where('benpen.user_id', $this->user)
            ->where('benpen.DK', 'D')
            ->get();

        $layanan = \App\Unit_layanan::find($this->idul);

        return view('exportExcel.penerimaan.bydate.detail', [
            'date' => $this->date,
            'unitlayanan' => $unit_layanan,
        ]);
    }
}
