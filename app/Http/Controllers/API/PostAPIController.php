<?php namespace App\Http\Controllers\API;

use App\Http\Requests;
use Mitul\Controller\AppBaseController;
use Mitul\Generator\Utils\ResponseManager;
use App\Models\Post;
use Illuminate\Http\Request;
use App\Libraries\Repositories\PostRepository;
use Response;

class PostAPIController extends AppBaseController
{

	/** @var  PostRepository */
	private $postRepository;

	function __construct(PostRepository $postRepo)
	{
		$this->postRepository = $postRepo;
	}

	/**
	 * Display a listing of the Post.
	 *
	 * @return Response
	 */
	public function index()
	{
		$posts = $this->postRepository->all();

		return Response::json(ResponseManager::makeResult($posts->toArray(), "Posts retrieved successfully."));
	}

	/**
	 * Show the form for creating a new Post.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created Post in storage.
	 *
	 * @param Request $request
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		if(sizeof(Post::$rules) > 0)
            $this->validateRequest($request, Post::$rules);

        $input = $request->all();

		$post = $this->postRepository->store($input);

		return Response::json(ResponseManager::makeResult($post->toArray(), "Post saved successfully."));
	}

	/**
	 * Display the specified Post.
	 *
	 * @param  int $id
	 *
	 * @return Response
	 */
	public function show($id)
	{
		$post = $this->postRepository->findPostById($id);

		if(empty($post))
			$this->throwRecordNotFoundException("Post not found", ERROR_CODE_RECORD_NOT_FOUND);

		return Response::json(ResponseManager::makeResult($post->toArray(), "Post retrieved successfully."));
	}

	/**
	 * Show the form for editing the specified Post.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified Post in storage.
	 *
	 * @param  int    $id
	 * @param Request $request
	 *
	 * @return Response
	 */
	public function update($id, Request $request)
	{
		$post = $this->postRepository->findPostById($id);

		if(empty($post))
			$this->throwRecordNotFoundException("Post not found", ERROR_CODE_RECORD_NOT_FOUND);

		$input = $request->all();

		$post = $this->postRepository->update($post, $input);

		return Response::json(ResponseManager::makeResult($post->toArray(), "Post updated successfully."));
	}

	/**
	 * Remove the specified Post from storage.
	 *
	 * @param  int $id
	 *
	 * @return Response
	 */
	public function destroy($id)
	{
		$post = $this->postRepository->findPostById($id);

		if(empty($post))
			$this->throwRecordNotFoundException("Post not found", ERROR_CODE_RECORD_NOT_FOUND);

		$post->delete();

		return Response::json(ResponseManager::makeResult($id, "Post deleted successfully."));
	}

}
