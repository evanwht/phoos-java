import React, { Component } from "react";
import FormControl from 'react-bootstrap/FormControl';
import Col from 'react-bootstrap/Col';
import InputGroup from 'react-bootstrap/InputGroup';

export class PlayerSelect extends Component {

    renderPlayerOptions(players) {
        return players.map((player) => {
            return (
                <option key={player.id} value={player.id}>{player.name} ({player.nickname})</option>
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
                        <option key="-1" value="-1"></option>
                        {this.renderPlayerOptions(this.props.players)}
                    </FormControl>
                </InputGroup>
            </Col>
        )
    }
}