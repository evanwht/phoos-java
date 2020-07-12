import React, { Component } from 'react'
import Form from 'react-bootstrap/Form';
import FormLabel from 'react-bootstrap/FormLabel';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';
import API from "../api/api";
import UserForm from "./UserForm";
import AlertDismissable from "./AlertDismiss";

export class PlayerForm extends Component {
    constructor(props) {
        super(props);
        this.state = {
            firstname: "",
            lastname: "",
            nickname: "",
            email: "",
            success: "",
            fail: ""
        }
        this.submit = this.submit.bind(this);
        this.change = this.change.bind(this);
        this.dismissAlert = this.dismissAlert.bind(this);
    };

    submit = e => {
        e.preventDefault();
        const { firstname, lastname, nickname, email } = this.state;
        API.post('players', {
            name: `${firstname} ${lastname}`,
            nickname: nickname,
            email: email
        }).then(res => {
            this.setState({
                firstname: "",
                lastname: "",
                nickname: "",
                email: "",
                success: `Successfully created user: ${firstname} ${lastname} (${nickname})`,
                fail: ""
            }, () => this.render())
        }).catch(reason => {
            this.setState({
                fail: "Could not create user. Please try again later.",
                success: ""
            }, () => this.render())
        });
    };

    change = e => {
        const name = e.target.name;
        this.setState({ [name]: e.target.value });
    };

    dismissAlert() {
        this.setState({
            success: "",
            fail: ""
        });
    }

    renderAlert(success, fail) {
        if (success) {
            return (
                <AlertDismissable
                    variant="success"
                    heading="Success"
                    message={success}
                    dismiss={this.dismissAlert}
                />
            )
        } else if (fail) {
            return (
                <AlertDismissable
                    variant="danger"
                    heading="Error"
                    message={fail}
                    dismiss={this.dismissAlert}
                />
            )
        }
        return null;
    };

    render() {
        return (
            <Row>
                <Col sm="8" md="6" className="mx-auto boxed">
                    <h3 className="pb-4 pt-4 text-white text-center">New Player</h3>
                    {this.renderAlert(this.state.success, this.state.fail)}
                    <UserForm
                        submit={this.submit}
                        submitButtonText="Create"
                        elements={() => (
                            <React.Fragment>
                                <FormLabel className="text-white">First Name</FormLabel>
                                <Form.Control
                                    type="text"
                                    name="firstname"
                                    value={this.state.firstname}
                                    className="mb-3"
                                    onChange={this.change}
                                />
                                <FormLabel className="text-white">Last Name</FormLabel>
                                <Form.Control
                                    type="text"
                                    name="lastname"
                                    value={this.state.lastname}
                                    className="mb-3"
                                    onChange={this.change}
                                />
                                <FormLabel className="text-white">Nick Name</FormLabel>
                                <Form.Control
                                    type="text"
                                    name="nickname"
                                    value={this.state.nickname}
                                    className="mb-3"
                                    onChange={this.change}
                                />
                                <FormLabel className="text-white">Email</FormLabel>
                                <Form.Control
                                    type="email"
                                    name="email"
                                    value={this.state.email}
                                    className="mb-3"
                                    onChange={this.change}
                                />
                            </React.Fragment>
                        )}
                    />
                </Col>
            </Row>
        )
    }
}