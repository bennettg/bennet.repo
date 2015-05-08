<?php namespace App\Http\Controllers\API;

use App\Http\Requests;
use App\Models\ModelName;
use Illuminate\Http\Request;
use Mitul\Controller\AppBaseController;
use Mitul\Generator\Utils\ResponseManager;
use Response;

class ModelNameAPIController extends AppBaseController
{

	/**
	 * Display a listing of the ModelName.
	 *
	 * @return Response
	 */
	public function index()
	{
		$modelNames = ModelName::all();

		return Response::json(ResponseManager::makeResult($modelNames->toArray(), "ModelNames retrieved successfully."));
	}

	/**
	 * Show the form for creating a new ModelName.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created ModelName in storage.
	 *
	 * @param Request $request
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		if(sizeof(ModelName::$rules) > 0)
            $this->validateRequest($request, ModelName::$rules);

        $input = $request->all();

		$modelName = ModelName::create($input);

		return Response::json(ResponseManager::makeResult($modelName->toArray(), "ModelName saved successfully."));
	}

	/**
	 * Display the specified ModelName.
	 *
	 * @param  int  $id
	 * @param Request $request
	 *
	 * @return Response
	 */
	public function show($id)
	{
		/** @var ModelName $modelName */
		$modelName = ModelName::find($id);

		if(empty($modelName))
			$this->throwRecordNotFoundException("ModelName not found", ERROR_CODE_RECORD_NOT_FOUND);

		return Response::json(ResponseManager::makeResult($modelName->toArray(), "ModelName retrieved successfully."));
	}

	/**
	 * Show the form for editing the specified ModelName.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified ModelName in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id, Request $request)
	{
		/** @var ModelName $modelName */
		$modelName = ModelName::find($id);

		if(empty($modelName))
			$this->throwRecordNotFoundException("ModelName not found", ERROR_CODE_RECORD_NOT_FOUND);

		$input = $request->all();

		$modelName->fill($input);
		$modelName->save();

		return Response::json(ResponseManager::makeResult($modelName->toArray(), "ModelName updated successfully."));
	}

	/**
	 * Remove the specified ModelName from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		/** @var ModelName $modelName */
		$modelName = ModelName::find($id);

		if(empty($modelName))
			$this->throwRecordNotFoundException("ModelName not found", ERROR_CODE_RECORD_NOT_FOUND);

		$modelName->delete();

		return Response::json(ResponseManager::makeResult($id, "ModelName deleted successfully."));
	}

}
