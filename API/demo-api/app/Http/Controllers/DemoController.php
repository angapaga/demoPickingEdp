<?php

namespace App\Http\Controllers;

use App\Models\Demo;
use App\Http\Requests\StoreDemoRequest;
use App\Http\Requests\UpdateDemoRequest;
use Illuminate\Http\Request;

class DemoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)//(StoreDemoRequest $request)
    {
        //variables de retorno
        $code = 500;
        $message = 'NO';
        //
        $contadorErrores = 0;
        $detalleErrores = array();
        // if( is_null( $request->id) || empty( $request->id) ) {
        //     $contadorErrores = $contadorErrores + 1;
        //     array_push($detalleErrores,"el campo [id] es necesario");
        // }
        if( is_null( $request->idmovimiento ) || empty( $request->idmovimiento) ){
            $contadorErrores = $contadorErrores + 1;
            array_push($detalleErrores,"el campo [idmovimiento] es necesario <br> ");
        }
        if ( is_null( $request->cbarra) || empty( $request->cbarra) ) {
            $contadorErrores = $contadorErrores + 1;
            array_push($detalleErrores,"el campo [cbarra] es necesario <br>");
        }
        $item = new Demo();
        if ($contadorErrores == 0) {
            $item->idmovimiento = $request->idmovimiento;
            $item->cbarra = $request->cbarra;
            $item->estado = 'A';
            $item->save();
            //
            $code = 200;
            $message = 'Ingreso exitoso.';
        }else{
            $code = 204;
            $message = $detalleErrores;
        }

        return response()->json([
            'code' => $code,
            'message' => $message,
            'result' => [$item],
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Demo $demo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Demo $demo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateDemoRequest $request, Demo $demo)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Demo $demo)
    {
        //
    }
    public function list_active()
    {
        //variables de retorno
        $code = 500;
        $message = 'NO';

        $items = array();
        try {
            $items = Demo::where('estado', 'A')->orderByDesc('id')->get();
            $code = 200;
            $message = 'OK';
        } catch (\Throwable $th) {
            $code = 204;
            $message = $th;
        }
        return response()->json([
            'code' => $code,
            'message' => $message,
            'result' => $items,
        ]);
    }
}
