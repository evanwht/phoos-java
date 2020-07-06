import React from 'react';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';

const UserForm = props => {
    const {
        submit,
        submitButtonText,
        elements,
    } = props;

    return (
        <React.Fragment>
            <Form onSubmit={submit}>
                {elements()}
                <Form.Row className="pr-1 pl-1 mb-4 mt-4">
                    <Button variant="primary" type="submit" block>{submitButtonText}</Button>
                </Form.Row>
            </Form>
        </React.Fragment >
    )
}

export default UserForm;