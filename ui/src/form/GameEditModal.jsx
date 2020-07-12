import React, { Component } from "react";
import Form from 'react-bootstrap/Form';
import FormLabel from 'react-bootstrap/FormLabel';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';
import Container from 'react-bootstrap/Container';
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';
import API from "../api/api";
import UserForm from "./UserForm";
import AlertDismissable from "./AlertDismiss";
import { PlayerSelect } from "./PlayerSelect";

export class GameEditModal extends Component {
    constructor(props) {
        super(props)
        this.state = {
            date: props.date,
            p1: props.p1,
            p2: props.p2,
            p3: props.p3,
            p4: props.p4,
            t1h: props.t1h,
            t2h: props.t2h,
            t1f: props.t1f,
            t2f: props.t2f,
            players: [],
            changed: new Set(),
            buttonVariant: "outline-primary"
        }
        this.submit = this.submit.bind(this);
        this.change = this.change.bind(this);
        this.dismissAlert = this.dismissAlert.bind(this);
    }

    componentDidMount() {
        API.get('players')
            .then(res => {
                const players = res.data;
                this.setState({ players });
            });
    }

    change = e => {
        let changed = this.state.changed;
        const name = e.target.name;
        if (!this.props[name].equals(e.target.value)) {
            changed.add(name);
        } else {
            changed.delete(name);
        }
        let buttonVariant = "outline-primary";
        if (changed.size > 0) {
            buttonVariant = "primary"
        }
        this.setState({
            [name]: e.target.value,
            buttonVariant: buttonVariant,
            changed: changed
        });
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

    buildGameChanges(fields) {
        let game = {
            team1: {},
            team2: {}
        };
        fields.forEach(name => {
            switch (name) {
                case "p1":
                    game.team1.defense = {
                        id: parseInt(this.state[name])
                    }
                    break;
                case "p2":
                    game.team1.offense = {
                        id: parseInt(this.state[name])
                    };
                    break;
                case "p3":
                    game.team2.defense = {
                        id: parseInt(this.state[name])
                    }
                    break;
                case "p4":
                    game.team2.offense = {
                        id: parseInt(this.state[name])
                    }
                    break;
                case "t1h":
                    game.team1HalfScore = parseInt(this.state[name]);
                    break;
                case "t2h":
                    game.team2HalfScore = parseInt(this.state[name]);
                    break;
                case "t1f":
                    game.team1FinalScore = parseInt(this.state[name]);
                    break;
                case "t2f":
                    game.team2FinalScore = parseInt(this.state[name]);
                    break;
                default:
                    game[name] = parseInt(this.state[name]);

            }
        });
        return game;
    }

    submit = e => {
        e.preventDefault();
        if (this.state.changed.size > 0) {
            API.put(`games/${this.props.id}`, this.buildGameChanges(this.state.changed))
                .then(res => {
                    this.setState({
                        changed: new Set(),
                        success: `Successfully created game`,
                        fail: ""
                    }, () => this.props.onChange())
                }).catch(reason => {
                    this.setState({
                        fail: "Could not create game. Please try again later.",
                        success: ""
                    }, () => this.render())
                });
        }
    };

    playerSelections() {
        return (
            <Form.Group id="players">
                <h4 className="pt-3 text-white text-center">Positions</h4>
                <div className="d-md-block d-sm-none d-none">
                    <Row className="pad text-white">
                        <Col sm="2"></Col>
                        <Col>Defense</Col>
                        <Col>Offense</Col>
                    </Row>
                </div>
                <Form.Group id="team-1">
                    <Form.Row>
                        <Col sm="2">
                            <FormLabel className="text-white">Team 1</FormLabel>
                        </Col>
                        <PlayerSelect
                            value={this.state.p1}
                            players={this.state.players}
                            name="p1"
                            position="Defense"
                            change={this.change}
                        />
                        <PlayerSelect
                            value={this.state.p2}
                            players={this.state.players}
                            name="p2"
                            position="Offense"
                            change={this.change}
                        />
                    </Form.Row>
                </Form.Group>
                <Form.Group id="team-2">
                    <Form.Row>
                        <Col sm="2">
                            <FormLabel className="text-white">Team 2</FormLabel>
                        </Col>
                        <PlayerSelect
                            value={this.state.p3}
                            players={this.state.players}
                            name="p3"
                            position="Defense"
                            change={this.change}
                        />
                        <PlayerSelect
                            value={this.state.p4}
                            players={this.state.players}
                            name="p4"
                            position="Offense"
                            change={this.change}
                        />
                    </Form.Row>
                </Form.Group>
            </Form.Group>
        )
    }

    scoreSelections() {
        return (
            <Form.Group id="scores">
                <h4 className="pb-2 text-white text-center">Scores</h4>
                <Form.Group>
                    <Form.Row>
                        <Col className="pr-2">
                            <h5 className="pb-2 text-white text-center">Half</h5>
                            <Form.Row>
                                <Col>
                                    <FormLabel className="text-white text-center">Team 1</FormLabel>
                                    <Form.Control
                                        name="t1h"
                                        type="number"
                                        value={this.state.t1h}
                                        onChange={this.change}
                                        max={5} min={0} required
                                    />
                                </Col>
                                <Col xs="2">
                                    <FormLabel className="text-hide">suh</FormLabel>
                                    <p className="text-white text-center">__</p>
                                </Col>
                                <Col>
                                    <FormLabel className="text-white text-center">Team 2</FormLabel>
                                    <Form.Control
                                        name="t2h"
                                        type="number"
                                        value={this.state.t2h}
                                        onChange={this.change}
                                        max={5} min={0} required
                                    />
                                </Col>
                            </Form.Row>
                        </Col>
                        <Col className="pl-2">
                            <h5 className="pb-2 text-white text-center">Final</h5>
                            <Form.Row>
                                <Col>
                                    <FormLabel className="text-white text-center">Team 1</FormLabel>
                                    <Form.Control
                                        name="t1f"
                                        type="number"
                                        value={this.state.t1f}
                                        onChange={this.change}
                                        max={15} min={0} required
                                    />
                                </Col>
                                <Col xs="2">
                                    <FormLabel className="text-hide">suh</FormLabel>
                                    <p className="text-white text-center">__</p>
                                </Col>
                                <Col>
                                    <FormLabel className="text-white text-center">Team 2</FormLabel>
                                    <Form.Control
                                        name="t2f"
                                        type="number"
                                        value={this.state.t2f}
                                        onChange={this.change}
                                        max={15} min={0} required
                                    />
                                </Col>
                            </Form.Row>
                        </Col>
                    </Form.Row>
                </Form.Group>
            </Form.Group>
        )
    }

    render() {
        return (
            <Modal size="lg" show={this.props.show} onHide={this.props.onHide} variant="dark">
                <Modal.Header className="dark">
                    <Modal.Title className="mx-auto">Edit Game</Modal.Title>
                </Modal.Header>
                <Modal.Body className="dark">
                    <Container>
                        {this.renderAlert(this.state.success, this.state.fail)}
                        <UserForm
                            submit={this.submit}
                            elements={() => (
                                <React.Fragment>
                                    {this.playerSelections()}
                                    <hr className="mt-4 border-teal" />
                                    {this.scoreSelections()}
                                </React.Fragment>
                            )}
                        />
                        <Form.Row className="pr-1 pl-1 mb-4 mt-4">
                            <Col>
                                <Button variant="secondary" onClick={this.props.onHide} block>Cancel</Button>
                            </Col>
                            <Col xs="1"></Col>
                            <Col>
                                <Button variant={this.state.buttonVariant} onClick={this.submit} block>Save</Button>
                            </Col>
                        </Form.Row>
                    </Container>

                </Modal.Body>
            </Modal>
        );
    }
}