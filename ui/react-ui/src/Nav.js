import React, { Component } from 'react';
import NavDropdown from 'react-bootstrap/NavDropdown';
import { Navbar, Nav } from 'react-bootstrap';

import './phoos.css';

export class Navigation extends Component {
    render() {
        return (
            <Navbar bg="dark" expand="md" variant="dark" fixed="top">
                <Navbar.Brand href="/"><img className="logo" src="/logo.png" alt="" /></Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                    <Nav className="mr-auto">
                        <Nav.Link href="/">Home</Nav.Link>
                        <Nav.Link href="/games">Games</Nav.Link>
                        <NavDropdown title="New" id="nav-dropdown">
                            <NavDropdown.Item href="/new/player">Player</NavDropdown.Item>
                            <NavDropdown.Divider />
                            <NavDropdown.Item href="/new/player">Game</NavDropdown.Item>
                        </NavDropdown>
                    </Nav>
                </Navbar.Collapse>
            </Navbar>
        );
    }
}
