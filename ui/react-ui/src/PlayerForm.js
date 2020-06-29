import React, { Component } from 'react'


export class PlayerForm extends Component {
    render() {
        return (
            <div class="container">
                <div class="row">
                    <div class="col-8 mx-auto undernav text-center">
                        <div class="pb-4 pt-4">
                            <h3>New Player</h3>
                        </div>
                        <form class="col-md-8 col-sm-10 mx-auto boxed pt-3 needs-validation" method="POST" action="api/players" novalidate>
                            <div class="form-group col">
                                <label class="col col-form-label-lg text-left text-white">First Name</label>
                                <div class="">
                                    <input name="firstName" type="text" class="centering form-control form-fill" required />
                                </div>
                            </div>
                            <div class="form-group col">
                                <label class="col col-form-label-lg text-left text-white">Last Name</label>
                                <div class="">
                                    <input name="lastName" type="text" class="centering form-control form-fill" required />
                                </div>
                            </div>
                            <div class="form-group col">
                                <label class="col col-form-label-lg text-left text-white">Knick Name</label>
                                <div class="">
                                    <input name="nickName" type="text" class="centering form-control form-fill" required />
                                </div>
                            </div>
                            <div class="form-group col">
                                <label class="col col-form-label-lg text-left text-white">Email</label>
                                <div class="">
                                    <input name="email" type="email" class="centering form-control form-fill" required />
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg mb-4 mt-4">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        )
    }
}