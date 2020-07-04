import React, { Component } from 'react'
import Form from 'react-bootstrap/Form';
import FormLabel from 'react-bootstrap/FormLabel';
import Button from 'react-bootstrap/Button';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';
import Container from 'react-bootstrap/Container';
import API from "./api";

export class PlayerForm extends Component {
    constructor(props) {
        super(props);
        this.form = React.createRef();
        this.firstname = React.createRef();
        this.lastname = React.createRef();
        this.nickname = React.createRef();
        this.email = React.createRef();
    }

    handleSubmit = event => {
        event.preventDefault();
        const player = {
            name: `${this.firstname.current.value} ${this.lastname.current.value}`,
            nickname: this.nickname.current.value,
            email: this.email.current.value 
        }
        API.post('players', {
            name: `${this.firstname.current.value} ${this.lastname.current.value}`,
            nickname: this.nickname.current.value,
            email: this.email.current.value 
        })
        .then(res => {
            console.log(res);
        })
    }

    render() {
        return (
            <Container>
                <Row>
                    <Col sm="8" className="mx-auto undernav">
                        <h3 className="pb-4 pt-4 text-white text-center">New Player</h3>
                        <Form ref={this.form} className="col-md-10 col-sm-12 mx-auto boxed pt-3" onSubmit={this.handleSubmit}>
                            <Form.Group controlId="FirstName">
                                <FormLabel className="text-white">First Name</FormLabel>
                                <Form.Control ref={this.firstname} type="text" className="mb-3 mt-2" />
                            </Form.Group>
                            <Form.Group controlId="LastName">
                                <FormLabel className="text-white">Last Name</FormLabel>
                                <Form.Control ref={this.lastname} type="text" className="mb-3 mt-2" />
                            </Form.Group>
                            <Form.Group controlId="NickName">
                                <FormLabel className="text-white">Nick Name</FormLabel>
                                <Form.Control ref={this.nickname} type="text" className="mb-3 mt-2" />
                            </Form.Group>
                            <Form.Group controlId="Email">
                                <FormLabel className="text-white">Email</FormLabel>
                                <Form.Control ref={this.email} type="email" className="mb-3 mt-2" />
                            </Form.Group>
                            <Form.Row>
                                <Col sm="6" className="mx-auto">
                                    <Button variant="primary" size="lg" type="submit" block className="mb-4 mt-2">Submit</Button>
                                </Col>
                            </Form.Row>
                        </Form>
                    </Col>
                </Row>
            </Container>
        )
    }
}