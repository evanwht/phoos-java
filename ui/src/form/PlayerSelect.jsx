import React, { Component } from "react";
import FormControl from 'react-bootstrap/FormControl';
import Col from 'react-bootstrap/Col';
import InputGroup from 'react-bootstrap/InputGroup';
import API from '../api/api';

export class PlayerSelect extends Component {
    constructor(props) {
        super(props);
        this.state = {
            players: []
        };
    };

    componentDidMount() {
        API.get('players')
            .then(res => {
                const players = res.data;
                this.setState({ players });
            });
    }

    renderPlayerOptions(players) {
        return players.map((player) => {
            return (
                <option value={player.id}>{player.name} ({player.nickname})</option>
            )
        })
    }

    render() {
        const { position, name, value, change } = this.props;
        return (
            <Col sm="12" md="5">
                <InputGroup>
                    <InputGroup.Prepend className="d-md-none d-block w-25">
                        <InputGroup.Text className="text-white">{position}</InputGroup.Text>
                    </InputGroup.Prepend>
                    <FormControl
                        as="select"
                        name={name}
                        value={value}
                        required
                        onChange={change}
                    >
                        <option value=""></option>
                        {this.renderPlayerOptions(this.state.players)}
                    </FormControl>
                </InputGroup>
            </Col>
        )
    }
}