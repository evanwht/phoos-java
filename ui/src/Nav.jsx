import React, { Component } from 'react';
import NavDropdown from 'react-bootstrap/NavDropdown';
import { Link } from 'react-router-dom'
import { Navbar, Nav } from 'react-bootstrap';

import './phoos.css';

export class Navigation extends Component {
    render() {
        return (
            <Navbar bg="dark" expand="md" variant="dark" fixed="top">
                <Navbar.Brand as={Link} to="/"><img className="logo" src="/logo.png" alt="" /></Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                    <Nav className="mr-auto">
                        <Nav.Link as={Link} to="/standings">Standings</Nav.Link>
                        <Nav.Link as={Link} to="/games">Games</Nav.Link>
                        <NavDropdown title="New" id="nav-dropdown">
                            <NavDropdown.Item as={Link} to="/new/player">Player</NavDropdown.Item>
                            <NavDropdown.Divider />
                            <NavDropdown.Item as={Link} to="/new/game">Game</NavDropdown.Item>
                        </NavDropdown>
                    </Nav>
                </Navbar.Collapse>
            </Navbar>
        );
    }
}
