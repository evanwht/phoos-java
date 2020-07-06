import React from 'react';
import Alert from 'react-bootstrap/Alert';

const AlertDismissable = props => {
    const {
        variant,
        heading,
        message,
        dismiss
    } = props;

    return (
        <Alert variant={variant} onClose={dismiss} dismissible>
            <Alert.Heading>{heading}</Alert.Heading>
            <p>{message}</p>
        </Alert>
    );
}

export default AlertDismissable;