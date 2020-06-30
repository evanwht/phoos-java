import React, { Component } from 'react'
import Form from 'react-bootstrap/Form';
import FormLabel from 'react-bootstrap/FormLabel';
import Button from 'react-bootstrap/Button';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';
import Container from 'react-bootstrap/Container';

export class PlayerForm extends Component {
    render() {
        return (
            <Container>
                <Row>
                    <Col sm="8" className="mx-auto undernav">
                        <h3 className="pb-4 pt-4 text-white text-center">New Player</h3>
                        <Form className="col-md-10 col-sm-12 mx-auto boxed pt-3" method="POST" action="api/players">
                            <Form.Group controlId="FirstName">
                                <FormLabel className="text-white">First Name</FormLabel>
                                <Form.Control name="firstname" type="text" className="mb-3 mt-2" />
                            </Form.Group>
                            <Form.Group controlId="LastName">
                                <FormLabel className="text-white">Last Name</FormLabel>
                                <Form.Control name="lastname" type="text" className="mb-3 mt-2" />
                            </Form.Group>
                            <Form.Group controlId="KnickName">
                                <FormLabel className="text-white">Knick Name</FormLabel>
                                <Form.Control name="kickname" type="text" className="mb-3 mt-2" />
                            </Form.Group>
                            <Form.Group controlId="Email">
                                <FormLabel className="text-white">Email</FormLabel>
                                <Form.Control name="email" type="email" className="mb-3 mt-2" />
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