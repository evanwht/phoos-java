import React from 'react';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

const UserForm = props => {
    const {
        submit,
        submitButtonText,
        elements,
    } = props;

    let button = null;
    if (props.submitButtonText) {
        button = (
            <Form.Row className="pr-1 pl-1 mb-4 mt-4">
                <Button variant="primary" type="submit" block>{submitButtonText}</Button>
            </Form.Row>
        );
    }

    return (
        <React.Fragment>
            <Form onSubmit={submit}>
                {elements()}
                {button}
            </Form>
        </React.Fragment >
    )
}

export default UserForm;