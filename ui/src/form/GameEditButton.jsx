import React, { Component } from 'react';
import Button from 'react-bootstrap/Button';
import { GameEditModal } from './GameEditModal'

export class GameEditButton extends Component {
    constructor(props) {
        super(props)
        this.showModal = this.showModal.bind(this);
        this.hideModal = this.hideModal.bind(this);
        this.handleChanged = this.handleChanged.bind(this);
        this.state = {
            show: false,
            changed: false
        }
    }

    renderEditModal() {
        const { id, played, p1, p2, p3, p4, t1h, t2h, t1f, t2f } = this.props;
        if (this.state.show) {
            return (
                <GameEditModal
                    show={this.state.show}
                    onHide={this.hideModal}
                    onChange={this.handleChanged}
                    id={id}
                    date={played}
                    p1={p1}
                    p2={p2}
                    p3={p3}
                    p4={p4}
                    t1h={t1h}
                    t2h={t2h}
                    t1f={t1f}
                    t2f={t2f}
                />
            )
        }
        return null;
    }

    handleChanged() {
        this.setState({
            changed: true
        })
    }

    showModal() {
        this.setState({
            show: true
        }, () => this.render());
    }

    hideModal() {
        this.setState({
            show: false
        }, () => this.props.refresh(this.state.changed));
    }

    render() {
        return (
            <React.Fragment>
                <Button variant="outline-warning" onClick={this.showModal}>Edit</Button>
                {this.renderEditModal()}
            </React.Fragment>
        )
    };
}
