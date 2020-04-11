<?php


namespace App\Modules\Tracker\Http\Requests;


use Illuminate\Foundation\Http\FormRequest;

class ApiRegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email'=>'required|string|email|unique:users',
            'name'=>'required|string',
            'password'=>'required|string',
            'invitation' => 'required|string'
        ];
    }

    public function messages()
    {
        return [
            'email.required'=>'You must enter an email',
            'name.required'=>'You must enter a name',
            'password.required'=>'You must enter a password',
            'invitation.required'=>'Invitation required',
        ];
    }
}
