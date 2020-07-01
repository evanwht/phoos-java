import React, { Component } from "react";
import Form from 'react-bootstrap/Form';
import FormLabel from 'react-bootstrap/FormLabel';
import FormControl from 'react-bootstrap/FormControl';
import Button from 'react-bootstrap/Button';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';
import Container from 'react-bootstrap/Container';
import InputGroup from 'react-bootstrap/InputGroup';

export class GameForm extends Component {
    renderPlayerOptions(id, name, position) {
        return (
            <Col sm="12" md="5">
                <InputGroup>
                    <InputGroup.Prepend className="d-md-none d-block w-25">
                        <InputGroup.Text>{position}</InputGroup.Text>
                    </InputGroup.Prepend>
                    <FormControl as="select" id={id} name={name} required>
                        <option value=""></option>
                        <option value="1">Evan White</option>
                    </FormControl>
                </InputGroup>
            </Col>
        );
    }

    render() {
        return (
            <Container className="mb-4">
                <Row>
                    <Col sm="12" md="9" id="scores" className="undernav mx-auto">
                        <h3 class="pb-4">New Game</h3>
                        <Form className="container boxed" method="POST" action="api/games" id="game_input_form">
                            <Form.Group className="pt-3" id="choosePlayers">
                                <h4>Starting Positions</h4>
                                <div class="d-md-block d-sm-none d-none">
                                    <Row className="pad">
                                        <Col sm="2"></Col>
                                        <Col>Defense</Col>
                                        <Col>Offense</Col>
                                    </Row>
                                </div>
                                <Form.Group id="team-1">
                                    <Form.Row>
                                        <Col>
                                            <FormLabel>Team 1</FormLabel>
                                        </Col>
                                        {this.renderPlayerOptions("player1", "t1_p1", "Defense")}
                                        {this.renderPlayerOptions("player2", "t1_p2", "Offense")}
                                    </Form.Row>
                                </Form.Group>
                                <Form.Group id="team-2">
                                    <Form.Row>
                                        <Col>
                                            <FormLabel>Team 2</FormLabel>
                                        </Col>
                                        {this.renderPlayerOptions("player3", "t2_p1", "Defense")}
                                        {this.renderPlayerOptions("player4", "t2_p2", "Offense")}
                                    </Form.Row>
                                </Form.Group>
                            </Form.Group>
                            <hr />
                            <Form.Group id="half_scores">
                                <h4 class="pt-2 mb-0">Half Time Scores</h4>
                                <Form.Group>
                                    <Form.Row>
                                        <Col>
                                            <FormLabel>Team 1</FormLabel>
                                            <Form.Control name="t1_half" id="halfScoreTeam1" type="number" max={5} min={0} required />
                                        </Col>
                                        <Col>
                                            <FormLabel>Team 2</FormLabel>
                                            <Form.Control name="t2_half" id="halfScoreTeam2" type="number" max={5} min={0} required />
                                        </Col>
                                    </Form.Row>
                                </Form.Group>
                            </Form.Group>
                            <Form.Group id="final_scores">
                                <h4 class="pt-2 mb-0">Final Scores</h4>
                                <Form.Group>
                                    <Form.Row>
                                        <Col>
                                            <FormLabel>Team 1</FormLabel>
                                            <Form.Control name="t1_final" id="endTeam1" type="number" max={15} min={0} required />
                                        </Col>
                                        <Col>
                                            <FormLabel>Team 2</FormLabel>
                                            <Form.Control name="t2_final" id="endTeam2" type="number" max={15} min={0} required />
                                        </Col>
                                    </Form.Row>
                                </Form.Group>
                            </Form.Group>
                            <Button variant="primary" size="lg" type="submit" className="mb-4 mt-2">Submit</Button>
                        </Form>
                    </Col>
                </Row>
            </Container>
        );
    }
}